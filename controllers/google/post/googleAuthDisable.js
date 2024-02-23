const speakeasy = require('speakeasy');
const connection = require('../../../database/')

function googleAuthDisable(req, res) {
    if (!req.session.googleAuthorization) return res.redirect('/');
    if(!req.session.logged) return res.redirect('/login');
    connection.query(`UPDATE accounts SET google_auth = ? WHERE id = ?`, ['!', req.session.global_id], (err, result) => {
        if(err) throw err;
        req.session.info = {
            "title": "Sukces",
            "message": "Poprawnie usunięto autoryzacje google"
        }
        return res.redirect('/settings')
    })
}

module.exports = googleAuthDisable;