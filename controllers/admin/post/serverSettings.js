const connection = require('../../../database')

function serverSettings(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    if(req.session.admin < 3) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Musisz być administratorem poziomu trzeciego, aby tego użyć"
        }
        return res.redirect('/acp/dashboard')
    }

    if(!req.body.cash) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Niepoprawne dane."
        }
        return res.redirect('/acp/dashboard')
    }
    if(!req.body.type) return res.redirect('/acp/dashboard')

    if(req.body.type != 1 && req.body.type != 2 && req.body.type != 3 && req.body.type != 4) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Niepoprawny typ."
        }
        return res.redirect('/acp/dashboard')
    }

    const map = {
        1: 'paycheck_hh',
        2: 'paycheck_newplayer_hh',
        3: 'paycheck',
        4: 'paycheck_newplayer'
    };
    
    const column = map[req.body.type];
    
    if (column) {
        connection.query(`UPDATE server_settings SET ${column} = ?`, [req.body.cash], (err, result) => {
            if (err) throw err;
            req.session.info = {
                "title": "Sukces",
                "message": "Pomyślnie zmieniono ustawienia serwera."
            }
            return res.redirect('/acp/dashboard')
        });
    }
    
}

module.exports = serverSettings