
async function charactersOnline(req, res) {
    if (!req.session.logged) return res.redirect('/login');
        return res.render('dashboard/characters/online.ejs'); 
}

module.exports = charactersOnline;
