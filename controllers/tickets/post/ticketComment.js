const connection = require('../../../database/');

function ticketComment(req, res) {
    if (!req.session.logged) return res.redirect('/login');
    if(!req.query.id) return res.redirect('/')
    if (!req.body.reply) {
        req.session.error = {
            "message": "Nie wprowadzono wszystkich danych!"
        };
        return res.redirect('/tickets/view?id=' + req.query.id);
    }
    const data = new Date()
    connection.query(`SELECT id, author_id from ucp_tickets WHERE id = ?`, [req.query.id], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            if(req.session.admin > 0 || req.session.global_id == result[0].author_id) {
                if(req.body.reply.length > 700) {
                    req.session.error = {
                        "message": "Maksymalna liczba znaków, to 700"
                    };
                    return res.redirect('/tickets/view?id=' + req.query.id);
                } 
                connection.query(`INSERT INTO ucp_tickets_messages(ticket_id, author_id, author_name, message, date) VALUES(?, ?, ?, ?, ?)`, [req.query.id, req.session.global_id, req.session.username, req.body.reply, data], (err, result) => {
                    if(err) throw err;
                    return res.redirect('/tickets/view?id=' + req.query.id);
                 })
            } else {
                return result.redirect('/')
            }
        }
    })
}
module.exports = ticketComment