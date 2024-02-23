const connection = require('../../../database/')

function shopPage(req, res) {
    if(!req.session.logged) return res.redirect('/login')
    return res.render('shop/shop.ejs')
}   

module.exports = shopPage