const connection = require('../../../database/');
const axios = require('axios')
function createTicket(req, res) {
    if (!req.session.logged) return res.redirect('/login');
    if (!req.body.description || !req.body.topic) {
        req.session.error = {
            "message": "Nie wprowadzono wszystkich danych!"
        };
        return res.redirect('/tickets/create');
    }

    const data = new Date();

    connection.query(
        `SELECT * FROM ucp_tickets WHERE author_id = ? AND status = ?`,
        [req.session.global_id, 0],
        (err, result) => {
            if (err) throw err;
            if (result?.length >= 3) {
                req.session.error = {
                    "message": "Posiadasz za dużo otwartych zgłoszeń (limit 3)"
                };
                return res.redirect('/tickets/create');
            } else {
                connection.query(
                    `INSERT INTO ucp_tickets (author_id, topic, status) VALUES (?, ?, ?)`,
                    [req.session.global_id, req.body.topic, 0],
                    (err, result) => {
                        if (err) throw err;

                        const ticketId = result.insertId; 
                        connection.query(
                            `INSERT INTO ucp_tickets_messages (ticket_id, author_id, author_name, message, date) VALUES (?, ?, ?, ?, ?)`,
                            [ticketId, req.session.global_id, req.session.username, req.body.description, data],
                            (err, result) => {
                                if (err) throw err;
                                axios.post(`https://discord.com/api/webhooks/1131615014298603530/_EUaI7DbBqOKr4ds3XWd_Rshgbq9kdI7wM5sBsyi_D_uXVU3yGsSz2BNWWimrMBnQFO_`, { content: `${req.session.username} utworzyl ticket: https://ucp.la-rp.pl:/tickets/view?id=${result.insertId}` })
                                return res.redirect('/tickets/list');
                            }
                        );
                    }
                );
            }
        }
    );
}

module.exports = createTicket;
