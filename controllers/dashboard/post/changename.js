const connection = require('../../../database')

function changename(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    if (!req.body.username || !req.body.username.trim() || req.body.username.includes('null') || req.body.username.includes(' ')) {
        req.session.info = {
            "title": "Wystąpił problem", 
            "message":"Niepoprawna ilość argumentów"
        }
        return res.redirect('/settings')
    }
    if(req.body.username.length < 3) {
        req.session.info = {
            "title": "Wystąpił problem", 
            "message":"Niepoprawna ilość znaków, minimalnie 3."
        }
        return res.redirect('/settings')
    }
    if(req.body.username.length > 16) {
		req.session.info = {
            "title": "Wystąpił problem",
			message: "Maksymalna długość nazwy użytkownika, to 16"
		}
		return res.redirect('/settings')
	}
    connection.query(`SELECT username FROM core_users WHERE username = ?`, [req.body.username], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            req.session.info = {
                "title": "Wystąpił problem", 
                "message":"Taka nazwa użytkownika już istnieje."
            }
            return res.redirect('/settings')
        } else {
            connection.query(`UPDATE core_users SET username = ? WHERE id = ?`, [req.body.username, req.session.global_id], (err, result) => {
                if(err) throw err;
                req.session.info = {
                    "title": "Sukces", 
                    "message":"Poprawnie zmieniono nazwę użytkownika."
                }
                return res.redirect('/settings')
            })
        }
    })
}

module.exports = changename