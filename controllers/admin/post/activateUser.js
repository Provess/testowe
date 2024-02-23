const connection = require('../../../database/')

function activateUser(req, res) {
    if(!req.session.logged) return res.redirect('/')
    if(req.session.admin < 4) return res.redirect('/')
    if(!req.query.id) return res.redirect('/acp/register')
    connection.query(`DELETE FROM verification_codes WHERE user_id = ?`, [req.query.id], (err, result) => {
        if(err) throw err;
        return res.redirect('/acp/users')
    })
}

module.exports = activateUser