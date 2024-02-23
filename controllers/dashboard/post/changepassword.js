const connection = require('../../../database')
const wp = require('whirlpool-js');

function changepassword(req, res) {
	if (!req.session.logged) return res.redirect('/login')
    if(!req.body.oldpassword || !req.body.newpassword) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Nieprawidłowa ilość argumentów przy zmianie hasła."
        }
        return res.redirect('/settings')
    }

    if(req.body.newpassword.length < 6) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Minimalna ilość znaków w haśle, to: 6"
        }
        return res.redirect('/settings')
    }
    connection.query(`SELECT members_pass_hash FROM core_accounts WHERE id = ?`, [req.session.global_id], (err, result) => {
        if(err) throw err;
        const OldHashed = wp.encSync(req.body.oldpassword, 'hex').toUpperCase()
        const NewHashed = wp.encSync(req.body.newpassword, 'hex').toUpperCase()
        if(OldHashed != result[0].password) {
            req.session.info = {
                "title": "Wystąpił problem",
                "message": "Stare hasło jest nieprawidłowe."
            }
            return res.redirect('/settings')
        } 
        if(NewHashed == result[0].password) {
            req.session.info = {
                "title": "Wystąpił problem",
                "message": "Nowe hasło jest takie same jak stare."
            }
            return res.redirect('/settings')
        } 
            connection.query(`UPDATE core_accounts SET members_pass_hash = ? WHERE id = ?`, [NewHashed, req.session.global_id], (err, result) => {
                if(err) throw err;
                req.session.info = {
                    "title": "Sukces",
                    "message": "Zmiana hasła przebiegła pomyślnie."
                }
                return res.redirect('/settings')
            })
        
    })
}
module.exports = changepassword