const connection = require('../../../database/');

function blockCharacter(req, res) {
  if (!req.session.logged || !req.query.id) return res.redirect('/');
  if (req.session.admin < 3) {
    req.session.info = { "title": "Wystąpił problem", "message": "Nie posiadasz do tego odpowiednich uprawnień" };
    return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
  }

  const Dataa = new Date().toLocaleString('en-GB');

  connection.query(`SELECT * FROM srv_characters WHERE uid = ?`, [req.query.id], (err, result1) => {
    if (err) throw err;
    if (!result1?.length) return res.redirect('/');

    connection.query(`SELECT username FROM core_users WHERE id = ?`, [result1[0].char_gid], (err, result2) => {
      if (err) throw err;
      if (result1[0].char_active == 0) {
        if (!req.body.reason) {
          req.session.info = { "title": "Wystąpił problem", "message": "Nie wprowadzono powodu." };
          return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
        }

        connection.query(`UPDATE srv_characters SET char_active = ? WHERE uid = ?`, [1,  req.query.id], (err, result) => {
          if (err) throw err;
          req.session.info = { "title": "Sukces", "message": "Poprawnie zablokowano postać." };
          // connection.query(`INSERT INTO penalties(admin_name, username, name, penalty_time, reason, time, type) VALUES(?, ?, ?, ?, ?, ?, ?)`, [req.session.username, result2[0].login, result1[0].name, 0, req.body.reason, Dataa, 4], (err, result3) => {
          //   if (err) throw err;
            return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
          // });
        });
      } else if (result1[0].status == 1) {
        connection.query(`UPDATE srv_characters SET char_active = ? WHERE uid = ?`, [0, req.query.id], (err, result) => {
          if (err) throw err;
          req.session.info = { "title": "Sukces", "message": "Poprawnie odblokowano postać." };
          return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
        });
      } else {
        return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
      }
    });
  });
}

module.exports = blockCharacter;
