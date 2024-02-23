const connection = require('../../../database/')

function viewTicket(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    if(!req.query.id) return res.redirect('/tickets/list')
    connection.query(`SELECT id, author_id, status FROM ucp_tickets WHERE id = ?`, [req.query.id], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            if(req.session.global_id == result[0].author_id || req.session.admin > 0) {
                connection.query(`SELECT * FROM ucp_tickets_messages WHERE ticket_id = ? ORDER BY date DESC`, [result[0].id], (err, result2) => {
                    if(err) throw err;
                    return res.render('tickets/user/viewTicket.ejs', {messages: result2, ticket: result[0]})
                })
            } else {
                return res.redirect('/tickets')
            }
        } else {
            return res.redirect('/tickets')
        }
    })
}
module.exports = viewTicket




