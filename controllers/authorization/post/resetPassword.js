const connection = require('../../../database/');
const bcrypt = require('bcrypt');
const saltRounds = 10;

function resetPassword(req, res) {
    if (!req.query.auth) return res.redirect('/');
    if (req.session.logged == true) return res.redirect('/');
    if (!req.body.password || !req.body.password_confirm) {
        req.session.error = {
            "message": "Nie wprowadzono wszystkich danych"
        };
        return res.redirect('/reset?auth=' + req.query.auth);
    }
    if (req.body.password != req.body.password_confirm) {
        req.session.error = {
            "message": "Hasła nie są takie same"
        };
        return res.redirect('/reset?auth=' + req.query.auth);
    }
    if (req.body.password.length < 6) {
        req.session.error = {
            message: "Minimalna ilość znaków w haśle, to: 6"
        };
        return res.redirect('/reset?auth=' + req.query.auth);
    }

    connection.query(`SELECT * FROM forgot_password WHERE auth_key = ?`, [req.query.auth], (err, result1) => {
        if (err) throw err;
        if (result1?.length) {
            const savedTimestamp = new Date(result1[0].timestamp).getTime();
            const currentTime = new Date().getTime();
            const fiveMinutes = 5 * 60 * 1000;
            if (currentTime - savedTimestamp > fiveMinutes) {
                connection.query(`DELETE FROM forgot_password WHERE auth_key = ?`, [req.query.auth], (err, result) => {
                    if (err) {
                        console.error('Wystąpił błąd podczas usuwania rekordu:', err);
                    }
                    return res.redirect('/');
                });
            }

            connection.query(`DELETE FROM forgot_password WHERE auth_key = ?`, [req.query.auth], (err, result) => {
                if (err) throw err;
                bcrypt.hash(req.body.password, saltRounds, (err, hashed) => {
                    if (err) throw err;
                    connection.query(`UPDATE core_users SET members_pass_hash = ? WHERE id = ?`, [hashed, result1[0].global_id], (err, result) => {
                        if (err) throw err;
                        return res.redirect('/login');
                    });
                });
            });
        } else {
            return res.redirect('/');
        }
    });
}

module.exports = resetPassword;
