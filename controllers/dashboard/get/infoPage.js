
function infoPage(req, res) {
    if (!req.session.logged) return res.redirect('/login');
    return res.render('dashboard/infoPage')
}

module.exports = infoPage