function loginPage(req, res) {
    if(req.session.logged == true) return res.redirect('/')
    return res.render('authorization/login.ejs', {layout: false})
}

module.exports = loginPage;