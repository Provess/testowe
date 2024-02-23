    
const transporter = require('../controllers/utils/mailer')
const mailOptions = {
    from: 'ucp.larp.pl@gmail.com',
    to: 'ucp.larp.pl@gmail.com',
    subject: 'Test',
    text: 'Test'
  };
  
function testMail(app) {
    let status = true;
    transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
        status = false;
    } else {
        status = true;
    }
    });

    app.get('/mailstatus',(req, res) => {
        if(!req.session.logged) return res.redirect('/login')
        if(req.session.admin < 1) return res.redirect('/')
        res.send(status)
    })
}
module.exports = testMail