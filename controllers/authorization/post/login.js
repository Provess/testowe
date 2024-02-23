const connection = require('../../../database');
const bcrypt = require('bcrypt');
const saltRounds = 10;

function login(req, res) {
    if (req.session.logged == true) return res.redirect('/');
    if (!req.body.username || !req.body.password || req.body.username.includes('null') || req.body.password.includes('null') || req.body.username.trim().length === 0 || req.body.password.trim().length === 0) {
        req.session.error = {
            message: "Nie wprowadzono wszystkich danych!"
        };
        return res.redirect('/login');
    }
    if (req.body.username.length < 3) {
        req.session.error = {
            message: "Nieprawidłowa ilość znaków"
        };
        return res.redirect('/login');
    }
    if (req.body.password.length < 6) {
        req.session.error = {
            message: "Minimalna ilość znaków w haśle, to: 6"
        };
        return res.redirect('/login');
    }

    connection.query(`SELECT id, username, email, members_pass_hash, admin, authorization, google_auth, member_game_ban FROM core_users WHERE username = ? OR email = ?`, [req.body.username, req.body.username], (err, result1) => {
        if (err) throw err;
        if (result1?.length) {
            bcrypt.compare(req.body.password, result1[0].members_pass_hash, (err, match) => {
                if (err) throw err;
                if (match) {
                    connection.query(`SELECT * FROM verification_codes WHERE user_id = ?`, [result1[0].id], (err, result) => {
                        if (err) throw err;
                        if (result?.length) {
                            req.session.error = {
                                message: "Sprawdź swojego maila, a następnie się zweryfikuj"
                            };
                            return res.redirect('/login');
                        } else {
                            if (result1[0].ucp_ban == 1) {
                                req.session.error = {
                                    message: `Twoje konto zostało zbanowane przez administratora: ${result1[0].ucp_ban_admin}`
                                };
                                return res.redirect('/login');
                            }
                            if (result1[0].google_auth !== "!") {
                                req.session.googleAuthorization = true;
                                return res.redirect('/auth/google/login?id=' + result1[0].id);
                            }
                            req.session.logged = true;
                            req.session.global_id = result1[0].id;
                            req.session.username = result1[0].login;
                            req.session.email = result1[0].email;
                            req.session.admin = result1[0].admin;
                        
                            req.session.authorized = result1[0].authorization;
                            if (result1[0].authorization !== 0) {
                                return res.redirect('/question?id=1');
                            } else {
                                return res.redirect('/');
                            }
                        }
                    });
                } else {
                    req.session.error = {
                        message: "Niepoprawne hasło"
                    };
                    return res.redirect('/login');
                }
            });
        } else {
            req.session.error = {
                message: "Niepoprawne dane"
            };
            return res.redirect('/login');
        }
    });
}

module.exports = login;
