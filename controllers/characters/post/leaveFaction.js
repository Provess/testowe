const connection = require('../../../database/')

function leaveFaction(req, res){
    if(!req.session.logged) return res.redirect('/login')
    if(!req.query.id) return res.redirect('/')

    connection.query(`SELECT accountid FROM users WHERE id = ?`, [req.query.id], (err, result) => {
        if(err) throw err;
        if(result[0].accountid != req.session.global_id) {
            req.session.info = { 
                "title": "Wystąpił problem",
                "message": "To nie jest twoja postać."
            }
            return res.redirect(`/characters?uid=${req.session.global_id}`)
        }
        connection.query(`UPDATE users SET faction = ? WHERE id = ?`, [0, req.query.id], (err, result) => {
            if(err) throw err;
            req.session.info = { 
                "title": "Sukces!",
                "message": "Pomyślnie opuszczono frakcję"
            }
            return res.redirect(`/characters/info?id=${req.query.id}&type=character`)
        })
    })
}

module.exports = leaveFaction;