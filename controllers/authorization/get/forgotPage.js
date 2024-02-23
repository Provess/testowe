function forgotPage(req, res) {
    if(req.session.logged == true) return res.redirect('/')
    return res.render('authorization/forgot.ejs', {layout: false})
}

module.exports = forgotPage;