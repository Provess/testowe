const connection = require('../../../database')

function createCharacter(req, res) {
    if(!req.session.logged) return res.redirect('/')
    return res.render('dashboard/characters/createCharacter')
}

module.exports = createCharacter;