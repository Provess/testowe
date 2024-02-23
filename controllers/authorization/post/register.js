const connection = require('../../../database/');
const sendRegistrationEmail = require('./sendEmail');
const bcrypt = require('bcrypt');
const saltRounds = 10;
const axios = require('axios');

function register(req, res) {
    if (req.session.logged) return res.redirect("/");

    if (!req.body.email || !req.body.username || !req.body.password || req.body.email.includes('null') || req.body.username.includes('null') || req.body.password.includes('null') || req.body.email.trim().length === 0 || req.body.username.trim().length === 0 || req.body.password.trim().length === 0) {
        req.session.error = {
            message: "Nie wprowadzono wszystkich danych!"
        };
        return res.redirect('/register');
    }

    if (!req.body.username || !req.body.username.trim() || req.body.username.includes('null') || req.body.username.includes(' ')) {
        req.session.error = {
            message: "Niepoprawna nazwa użytkownika!"
        };
        return res.redirect('/register');
    }

    if (req.body.username.length < 3) {
        req.session.error = {
            message: "Nieprawidłowa ilość znaków"
        };
        return res.redirect('/register');
    }

    if (req.body.username.length > 16) {
        req.session.error = {
            message: "Maksymalna długość nazwy użytkownika, to 16"
        }
        return res.redirect('/register');
    }

    if (req.body.password.length < 6) {
        req.session.error = {
            message: "Minimalna ilość znaków w haśle, to: 6"
        };
        return res.redirect('/register');
    }

    if (req.body.username.includes(" ")) {
        req.session.error = {
            message: "Niepoprawna nazwa użytkownika"
        };
        return res.redirect('/register');
    }

    if (/[\s!@#$%^&()<>]/.test(req.body.username)) {
        req.session.error = {
            message: "Nieprawidłowa nazwa użytkownika"
        };
        return res.redirect('/register');
    }

    if (req.body.password != req.body.password2) {
        req.session.error = {
            message: "Hasła nie są takie same"
        };
        return res.redirect('/register');
    }

    const allowedDomains = ['gmail.com', 'int.pl', 'interia.eu', 'interia.pl', 'o2.pl', 'onet.pl', 'outlook.com', 'protonmail.com', 'tlen.pl', 'wp.pl'];
    const domain = req.body.email.split('@')[1];
    if (!allowedDomains.includes(domain)) {
        req.session.error = {
            message: "Niepoprawny adres email"
        };
        console.log("niepoprawny email")
        return res.redirect('/register');
    }

    if (!req.recaptcha.error) {
        connection.query(`SELECT id, username, email FROM core_users WHERE email = ? OR username = ?`, [req.body.email, req.body.username], (err, result) => {
            if (err) throw err;
            if (result?.length) {
                req.session.error = {
                    message: "Takie konto już istnieje!"
                };
                return res.redirect('/register');
            } else {
                bcrypt.hash(req.body.password, saltRounds, (err, hashed) => {
                    if (err) throw err;
                    connection.query(`INSERT INTO core_users(username, email, members_pass_hash) VALUES (?, ?, ?)`, [req.body.username, req.body.email, hashed], (err, result) => {
                        if (err) throw err;
                        connection.query(`SELECT id FROM core_users WHERE username = ?`, [req.body.username], (err, result) => {
                            if (err) throw err;
                            // axios.post(`https://discord.com/api/webhooks/1131615014298603530/_EUaI7DbBqOKr4ds3XWd_Rshgbq9kdI7wM5sBsyi_D_uXVU3yGsSz2BNWWimrMBnQFO_`, { content: `${req.body.username} zalozyl konto` });
                            sendRegistrationEmail(req.body.username, req.body.email, result[0].id, req, res);
                        });
                    });
                });
            }
        });
    } else {
        req.session.error = {
            message: "Wystąpił błąd z reCAPTCHA",
        };
        console.log(req.recaptcha.error);
        return res.redirect('/register');
    }
}

module.exports = register;
