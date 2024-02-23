const connection = require('../../../database/')

function createTicket(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    return res.render('tickets/user/createTicket.ejs')
}
module.exports = createTicket




