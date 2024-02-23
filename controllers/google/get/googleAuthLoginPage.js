function googleAuthLoginPage(req, res) {
    if(req.session.logged == true) return res.redirect('/')
    if(!req.session.googleAuthorization) return res.redirect('/')
    return res.render('authorization/googleAuth.ejs', {layout: false})
}
module.exports = googleAuthLoginPage