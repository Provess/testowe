const connection = require('../../../database')
const crypto = require('crypto')
const transporter = require('../../utils/mailer')
function sendForgot(req, res) {
    if(req.session.logged == true) return res.redirect('/')
    const mail = req.body.email
      let auth_key = ""
function generateAuthKey() {
    auth_key = crypto.randomBytes(32).toString('hex');
    connection.query(`SELECT auth_key FROM forgot_password WHERE auth_key = ?`, [auth_key], (err, result) => {
        if (err) throw err;
        if (result?.length) {
            generateAuthKey();
        } else {
            connection.query(`SELECT id FROM core_users WHERE email = ?`, [mail], (err, result2) => {
             if(err) throw err;
             console.log(result2)
             console.log(mail)
             if(result2?.length) {
                const currentDate = new Date();
                currentDate.setHours(currentDate.getHours() + 2);
                const timestamp = currentDate.toISOString().replace('T', ' ').substring(0, 19);                
                connection.query(`INSERT INTO forgot_password(global_id, auth_key, timestamp) VALUES(?, ?, ?)`, [result2[0].id, auth_key, timestamp], (err, result) => {
                    if(err) throw err;
                    let mailOptions = {
                        from: 'LA-RP',
                        to: mail,
                        subject: 'Przypomnienie hasła.',
                        html: `
                        <!DOCTYPE html>
                        <html>
                        <head>
                            <title>Witamy na Los Angeles Roleplay!</title>
                            <style>
                                body {
                                    text-align: center;
                                    font-family: Arial, sans-serif;
                                    background-color: #f5f5f5;
                                }
                        
                                h1 {
                                    margin-top: 50px;
                                    font-size: 24px;
                                }
                        
                                p {
                                    font-size: 18px;
                                    color: #333333;
                                    margin-bottom: 20px;
                                }
                                
                                .auto {
                                  color: black;
                                  margin-bottom: 20px;
                                  background-color: #f0463a;
                                  border: 1px solid black;
                                  padding: 5px;
                                }
                                .link {
                                  display: inline-block;
                                  margin-top: 20px;
                                  padding: 10px 20px;
                                  background-color: #007bff;
                                  color: #fff;
                                  text-decoration: none;
                                  border-radius: 4px;
                                }
                            </style>
                        </head>
                        <body>
                            <img src="https://i.imgur.com/4ODvLg9.png" alt="Logo Los Angeles Roleplay">
                            <h1>Witamy na Los Angeles Roleplay!</h1>
                            <span class="auto">NIE UDOSTĘPNIAJ SWOJEGO LINKU PRZYPOMNIENIA HASŁA NIKOMU!</span>
                        
                            <p>Poniżej znajduje się link do resetu hasła, jeśli to nie ty - pomiń te wiadomość.</p>
                            <h1> Link straci ważność za 5 minut </h1>
                            <a class="link" href="https://ucp.la-rp.pl/reset?auth=${auth_key}">
                            KLIKNIJ TUTAJ
                          </a> 
                            </body>
                        </html>
                        `
                      };
                      transporter.sendMail(mailOptions, (error, info) => {
                        if (error) throw error;
                        console.log(info.response)
                      });
                      req.session.error = {
                        "type": 'info',
                        "title": "Sukces",
                        "message": "Sprawdź swoją skrzynkę pocztową"
                    }
                    return res.redirect('/forgot')
                })
             } else {
                req.session.error = {
                    "type": 'info',
                    "title": "Sukces",
                    "message": "Sprawdź swoją skrzynkę pocztową"
                }
                return res.redirect('/forgot')
             } 
            })
        }
    })
}
    generateAuthKey();     
}

module.exports = sendForgot