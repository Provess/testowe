const connection = require('../../../database')

function submitRegister(req, res) {
    if(req.session.logged == true) return res.redirect('/')
    const {auth} = req.query
    if(!auth) return res.redirect('/login')
   connection.query(`SELECT * FROM verification_codes WHERE verification_code = ?`, [auth], (err, result) => {
    if(err) throw err;
    if(result?.length) {
        connection.query(`DELETE FROM verification_codes WHERE verification_code = ?`, [auth], (err, result) => {
        if(err) throw err;
        return res.redirect('/login')
        })
    } else return res.redirect('/login')
   })
}

module.exports = submitRegister