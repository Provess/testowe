const speakeasy = require('speakeasy');
const connection = require('../../../database/')

function googleAuthCheck(req, res) {
    if(!req.session.logged) return res.redirect('/')
    if(!req.body.code) return res.redirect('/settings')
  var verify =  speakeasy.totp.verify({
        secret: req.session.secret.ascii,
        encoding: 'ascii',
        token: req.body.code
    })
    if(verify == true) {
       connection.query(`UPDATE accounts SET google_auth = ? WHERE id = ?`, [req.session.secret.ascii, req.session.global_id], (err, result) => {
        if(err) throw err;
        req.session.info = {
            "title": "Sukces",
            "message": "Pomyślnie uruchomiono google auth"
        }
        req.session.googleAuthorization = true;
        req.session.secret = "none"
        return res.redirect('/settings')
       })
    } else {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Spróbuj wygenerować kod ponownie"
        }
        return res.redirect('/settings')
    }
}

module.exports = googleAuthCheck