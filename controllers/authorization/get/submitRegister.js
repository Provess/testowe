const connection = require('../../../database/')

function submitRegister(req, res) {
    if(req.session.logged == true) return res.redirect('/')
    const {auth} = req.query
    if(!auth) return res.redirect('/login')
    connection.query(`SELECT * FROM verification_codes WHERE verification_code = ?`, [auth], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            return res.render('authorization/submitRegister.ejs', {auth: auth, layout: false})
        } else {
            return res.redirect('/login')
        }
    })

}

module.exports = submitRegister;