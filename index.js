const express = require('express');
const path = require('path');
const app = express();
const connection = require('./database')
const config = require('./config.json')



// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// session manager 
const session = require('express-session');
app.use(session({
  secret: config.sessionsecret,
  resave: true,
  saveUninitialized: true,
  cookie: {
    maxAge: 21600000,
    httpOnly: true,
  }
}));

// cors
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

// layouts ejs
const expressLayouts = require('express-ejs-layouts');
app.use(expressLayouts);

// req
app.use((req, res, next) => {
  let lastSessionUpdate = 0;
  const now = Date.now();
  const fifteenSeconds = 15 * 1000;
  res.locals.req = req;

  if (req.session.logged == true) {
    if (req.url == '/logout') {
      next();
      return;
    }
    if(req.session.ucp_ban == 1) {
      return res.redirect('/logout')
    }
    if (req.session.authorized != 0 && req.url != '/question') {
      return res.redirect('/question');
    }

    if (now - lastSessionUpdate >= fifteenSeconds) {
      connection.query(
        `SELECT admin, username, email, authorization, google_auth FROM core_users WHERE id = ?`,
        [req.session.global_id],
        (err, result) => {
          if (err) throw err;
          if (result?.length) {
            const { admin, username, email, authorization, google_auth, member_game_ban } = result[0];
            let googleAuth;
            if(google_auth == "!") {
              googleAuth = false
            } else {
              googleAuth = true
            }
            req.session.admin = admin;
            req.session.username = username;
            req.session.email = email;
            req.session.authorized = authorization;

            req.session.googleAuthorization = googleAuth;
            req.session.ucp_ban = member_game_ban;

            const { sessions } = req.sessionStore;
            Object.entries(sessions).forEach(([sessionId, session]) => {
              const parsed = JSON.parse(session);
              if (parsed.global_id == req.session.global_id) {
                parsed.admin = admin;
                parsed.username = username;
                parsed.email = email;
                parsed.authorization = authorization;
                parsed.googleAuthorization = googleAuth;
                parsed.ucp_ban = member_game_ban;
                req.sessionStore.sessions[sessionId] = JSON.stringify(parsed);
              }
            });
            next();
          } else {
            return res.redirect('/logout');
          }
        }
      );
    } else {
      next();
    }
  } else {
    next();
  }
});



const loadUtils = require('./handlers/utilsLoader.js');
loadUtils(app);

// ejs views
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.set('layout', 'layouts/layout');

// assets
app.use(express.static(path.join(__dirname, 'views')));

// routes

// dashboard etc

/*
    API ONLINE
                */

const query = require('samp-query');

let options = {
  host: config.samp.host,
  port: config.samp.port
};

app.get('/api/online', (req, res) => {
 if(!req.session.logged) return res.redirect('/') 
  query(options, (err, result) => {
    if(err) {
      result = "błąd"
    }
    res.json(result) 
  })
})

const testMail = require('./testers/mail.js')
testMail(app)


/*
    API ONLINE
                */

const dashboardPages = require('./routes/dashboardPages.js')
app.use('/', dashboardPages)

const authorization = require('./routes/authorization.js')
app.use('/', authorization)

const charactersPages = require('./routes/characters.js')
app.use('/', charactersPages)

const adminPages = require('./routes/admin.js')
app.use('/acp', adminPages)

const ticketPages = require('./routes/tickets.js')
app.use('/tickets', ticketPages)

const shopPages = require('./routes/shop.js')
app.use('/shop', shopPages)

const googleAuth = require('./routes/googleAuth.js')
app.use('/auth', googleAuth)

const paypalApi = require('./routes/paypal.js')
app.use('/paypal', paypalApi)
// error page
app.get('*', (req, res) => {
    res.render('404', {layout: false});
  });
  
// listening

if (config.https.status == true) {
  const https = require("https");
  const fs = require("fs");
  
  const options = {
    key: fs.readFileSync(`${config.https.key}key.pem`),
    cert: fs.readFileSync(`${config.https.cert}cert.pem`),
  };

  var server = https.createServer(options, app);
  server.listen(443, () => {
      console.log(`Listening on port: 443\nPath to key: ${config.https.key}/key.pem\nPath to cert: ${config.https.cert}/cert.pem`);
  });
} else {
  app.listen(config.port || 80, () => {
      console.log(`Listening on port: ${config.port ? config.port : 80}`);
  });
}

// cron

const ssh2 = require('ssh2');
const cron = require('node-cron');
const connectionProperties = {
  host: '135.125.112.188',
  port: 22,
  username: 'root', 
  password: 'GcTt9CUJ'
};


cron.schedule('0 4 * * *', () => {
  const conn = new ssh2.Client();
  conn.on('ready', () => {
    conn.shell((err, stream) => {
      if (err) throw err;
      stream.write('killall screen\n');
      stream.write('sh /home/samp/start.sh\n');
      stream.on('close', () => {
        conn.end();
      });
    });
  });
  conn.connect(connectionProperties);
}, {
  scheduled: true,
  timezone: 'Europe/Warsaw' 
});





