const connection = require('../../../database/')

function settingsPage(req, res) {
    if(!req.session.logged) return res.redirect('/login')
  connection.query(`SELECT ucp_status FROM core_users WHERE id = ?`, [req.session.global_id], (err, result) => {
    if(err) throw err;
    return res.render('dashboard/settings.ejs', {status: result[0].ucp_status})
  })
}
module.exports = settingsPage