const connection = require('../../../database')

function searchCharacter(req, res) {
    if(!req.session.logged) return res.redirect('/')
    if(!req.body.character){
        req.session.error = { 
            "message": "Nie wpisałeś wszystkich danych"
        }
        return res.redirect(`/characters?uid=${req.session.global_id}`)
    }
    connection.query(`SELECT id, accountid, name FROM users WHERE name = ?`, [req.body.character], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            return res.redirect(`/characters?uid=${result[0].accountid}`)
        } else {
            req.session.error = { 
                "message": "Nie znaleziono takiej postaci"
            }
            return res.redirect(`/characters?uid=${req.session.global_id}`)
        }
    })
}

module.exports = searchCharacter