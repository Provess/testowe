const connection = require('../../../database')

function setstatus(req, res){
    if(!req.session.logged) return res.redirect('/login')
    if(req.body.status.length > 60) {
        req.session.info = {
            "title":"Wystąpił problem",
            "message":"Maksymalna ilość znaków, to: 60"
        }
        return res.redirect('/settings')
    }
    connection.query(`UPDATE core_accounts SET ucp_status = ? WHERE id = ?`, [req.body.status, req.session.global_id], (err, result) => {
        if(err) throw err;
        req.session.info = {
            "title":"Sukces!",
            "message":"Pomyślnie ustawiono status w profilu."
        }
        return res.redirect('/settings')
    })
}

module.exports = setstatus