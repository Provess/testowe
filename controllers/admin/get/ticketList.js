const connection = require('../../../database/')

function ticketList(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    if (req.session.admin < 1) return res.redirect('/');
    const page = req.query.page || 1;  
    const limit = 10; 
    const offset = (page - 1) * limit;  

    connection.query('SELECT COUNT(*) AS totalCount FROM ucp_tickets', (err, countResult) => {
        if (err) throw err;

        const totalCount = countResult[0].totalCount; 
        const totalPages = Math.ceil(totalCount / limit); 

        connection.query('SELECT * FROM ucp_tickets ORDER BY status = 0 DESC, status LIMIT ?, ?', [offset, limit], (err, result) => {
            if (err) throw err;
            return res.render('admin/tickets.ejs', { tickets: result, page, totalPages });
        });
    });
}
module.exports = ticketList




