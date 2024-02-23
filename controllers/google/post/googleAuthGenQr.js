
const connection = require('../../../database/');
const speakeasy = require('speakeasy');
const qrcode = require('qrcode');

function googleAuthGenQr(req, res) {
  if (!req.session.logged) return res.redirect('/');
  connection.query(`SELECT google_auth FROM accounts WHERE id = ?`, [req.session.global_id], (err, result) => {
    if (err) throw err;
    if (result[0].google_auth == "!") {

    const secret = speakeasy.generateSecret({
        "name": "LARP"
    })
      qrcode.toDataURL(secret.otpauth_url, (err, data_url) => {
        if (err) {
          console.error('Błąd generowania kodu QR:', err);
          req.session.error = {
            "title": "Błąd generowania kodu QR",
            "message": "Wystąpił błąd podczas generowania kodu QR. Spróbuj ponownie później."
          };
          return res.redirect('/settings');
        }
        req.session.secret = secret
        req.session.qr = {
          "title": "Kod do wpisania ręcznie",
          "message": `<img src="${data_url}"></img>`
        };
        return res.redirect('/settings');
      });

    } else {
      req.session.info = {
        "title": "Wystąpił błąd",
        "message": "Masz już wygenerowane google auth"
      }
      return res.redirect('/settings');
    }
  });
}

module.exports = googleAuthGenQr;
