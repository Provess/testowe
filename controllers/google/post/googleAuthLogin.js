const speakeasy = require('speakeasy');
const connection = require('../../../database/')

function googleAuthLogin(req, res) {
    if (req.session.logged) return res.redirect('/');
    if (!req.session.googleAuthorization) return res.redirect('/');
    if (!req.query.id) return res.redirect('/');
    
    if (!req.body.code) {
        req.session.error = {
            "message": "Nie wpisano kodu"
        };
        return res.redirect('/auth/google/login?id=' + req.query.id);
    }
    
    connection.query(
        `SELECT id, login, email, password, admin, developer, helper, donate, authorization, google_auth FROM accounts WHERE id = ?`,
        [req.query.id],
        (err, result) => {
            if (err) throw err;
            if (result?.length) {
                var verify2 = speakeasy.totp.verify({
                    secret: result[0].google_auth,
                    encoding: 'ascii',
                    token: req.body.code
                });
                if (verify2) {
                    req.session.logged = true;
                    req.session.global_id = result[0].id;
                    req.session.username = result[0].login;
                    req.session.email = result[0].email;
                    req.session.admin = result[0].admin;
                    req.session.developer = result[0].developer;
                    req.session.helper = result[0].helper;
                    req.session.donate = result[0].donate;
                    req.session.authorized = result[0].authorization;
                    req.session.gamescore = result[0].gamescore;
                    return res.redirect(result[0].authorization !== 0 ? '/question?id=1' : '/');
                } else {
                    req.session.error = {
                        "message": "Niepoprawny kod"
                    };
                    return res.redirect('/auth/google/login?id=' + req.query.id);
                }
            } else {
                return res.redirect('/');
            }
        }
    );
}

module.exports = googleAuthLogin 