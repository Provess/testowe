const connection = require('../../../database')

function update(req, res) {
    if(!req.session.logged) return res.redirect('/')
    if(req.session.admin < 4) return res.redirect('/')
    if(!req.query.id) return res.redirect('/acp/register')
    if(!req.body.username || !req.body.email || !req.body.admin) return res.redirect('/acp/users')
    if(req.body.admin < 0 || req.body.admin > 5) return res.redirect('/')

    connection.query(`SELECT id FROM accounts WHERE id = ?`, [req.query.id], (err, result) =>{
        if(err) throw err;
        if(result?.length) {
            connection.query(`UPDATE accounts SEt login = ?, email = ?, admin = ? WHERE id = ?`, [req.body.username, req.body.email, req.body.admin, req.query.id], (err, result) => {
                if(err) throw err;
                return res.redirect('/acp/users')
            })
        } else {
            return res.redirect('/acp/users')
        }
    })
}
module.exports = update