const connection = require('../../../database/');

function warnCharacter(req, res) {
  if (!req.session.logged || !req.query.id) return res.redirect('/');
  if (req.session.admin < 3) {
    req.session.info = { "title": "Wystąpił problem", "message": "Nie posiadasz do tego odpowiednich uprawnień" };
    return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
  }
  const Dataa = new Date().toLocaleString('en-GB');
  connection.query(`SELECT accountid, name FROM users WHERE id = ?`, [req.query.id], (err, result1) => {
    if(err) throw err;
    if(result1?.length) {
        if (!req.body.reason) {
            req.session.info = { "title": "Wystąpił problem", "message": "Nie wprowadzono powodu." };
            return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
          }
        connection.query(`SELECT login FROM accounts WHERE id = ?`, [result1[0].accountid], (err, result2) => {
            if(err) throw err;
            connection.query(`INSERT INTO penalties(admin_name, username, name, penalty_time, reason, time, type) VALUES(?, ?, ?, ?, ?, ?, ?)`, [req.session.username, result2[0].login, result1[0].name, 0, req.body.reason, Dataa, 2], (err, result3) => {
                if (err) throw err;
                req.session.info = { "title": "Sukces", "message": "Pomyślnie nadano ostrzeżenie" };
                return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
            });
        })
    } else {
        return res.redirect('/')
    }
  })

}

module.exports = warnCharacter