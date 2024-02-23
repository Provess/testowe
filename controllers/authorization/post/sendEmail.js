const transporter = require('../../utils/mailer')
const connection = require('../../../database/')
function sendMail(username, email, id, req, res){

let verification_code = ""
function generateVerificationCode() {
    verification_code = Array.from({
        length: 16
    }, () => Math.random().toString(36)[2]).join('');
    connection.query(`SELECT verification_code FROM verification_codes WHERE verification_code = ?`, [verification_code], (err, result) => {
        if (err) throw err;
        if (result?.length) {
            generateVerificationCode();
        } else {
            connection.query(`INSERT INTO verification_codes (user_id, verification_code) VALUES(?, ?)`, [id, verification_code], (err, result) => {
                    if (err) throw err;
                    let mailOptions = {
                        from: 'LA-RP',
                        to: email,
                        subject: 'Potwierdzenie rejestracji.',
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
                            <span class="auto">NIE UDOSTĘPNIAJ SWOJEGO LINKU WERYFIKACYJNEGO NIKOMU!</span>
                            <p>Dziękujemy za rejestrację na Los Angeles Roleplay. Cieszymy się, że dołączyłeś do naszej społeczności.</p>
                            <p>Kliknij w przycisk poniżej, aby zatwierdzić swoje konto.</p>
                            <a class="link" href="https://ucp.la-rp.pl/authorization/verify?auth=${verification_code}">
                            KLIKNIJ TUTAJ
                            </a>
                          </a> 
                            </body>
                        </html>
                        `
                      };
                      // <a class="link" href="https://ucp.la-rp.pl/authorization/verify?auth=${verification_code}">
                      transporter.sendMail(mailOptions, (error, info) => {
                        if (error) throw err;
                        console.log(info.response)
                      });
                      req.session.info = {
                        title: "Sukces!",
                        message: "Sprawdź swoją skrzynkę pocztową!"
                      }
                    return res.redirect('/login');
                });
        }
    });
}
generateVerificationCode();

}
module.exports = sendMail;