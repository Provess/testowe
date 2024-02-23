const connection = require('../../../database')

function closeTicket(req, res) {
    if (!req.session.logged) return res.redirect('/login');
    if(!req.query.id) return res.redirect('/')
    connection.query(`SELECT id, author_id FROM ucp_tickets WHERE id = ?`, [req.query.id], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            if(req.session.admin > 0 || req.session.global_id == result[0].author_id) {
                connection.query(`UPDATE ucp_tickets SET status = ? WHERE id = ?`, [1, req.query.id], (err, result) => {
                    if(err) throw err;
                    return res.redirect('/tickets/view?id=' + req.query.id)
                })
            } else {
                return res.redirect('/')
            }
        } else {
            return res.redirect('/')
        }
    })
}
module.exports = closeTicket