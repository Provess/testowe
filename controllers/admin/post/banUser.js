const connection = require('../../../database/')

function banUser(req, res) {
if(!req.session.logged) return res.redirect('/login')
if(!req.query.id) return res.redirect('/acp/users')
if (req.session.admin < 4) {
    req.session.info = { "title": "Wystąpił problem", "message": "Nie posiadasz do tego odpowiednich uprawnień" };
    return res.redirect(`/`);
  }

connection.query(`SELECT id, ucp_ban FROM accounts WHERE id = ?`, [req.query.id], (err, result) => {
    if(err) throw err;
    if(result?.length) {
        let status = result[0].ucp_ban == 0 ? 1 : 0;
        connection.query(`UPDATE accounts SET ucp_ban = ?, ucp_ban_admin = ? WHERE id = ?`, [status, req.session.username, req.query.id], (err, result) => {
            if(err) throw err;
            return res.redirect('/acp/users')
        })
    } else {
        return res.redirect('/acp/users')
    }
})
}
module.exports = banUser;