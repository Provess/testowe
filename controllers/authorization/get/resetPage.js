const connection = require('../../../database');

function resetPage(req, res) {
  if (req.session.logged == true) return res.redirect('/');
  if (!req.query.auth) return res.redirect('/login');

  connection.query(`SELECT * FROM forgot_password WHERE auth_key = ?`, [req.query.auth], (err, result) => {
    if (result?.length) {
      const savedTimestamp = new Date(result[0].timestamp).getTime();
      const currentTime = new Date().getTime();
      const fiveminutes = 5 * 60 * 1000;
      if (currentTime - savedTimestamp > fiveminutes) {
        connection.query(`DELETE FROM forgot_password WHERE auth_key = ?`, [req.query.auth], (err, result) => {
          if (err) {
            console.error('Wystąpił błąd podczas usuwania rekordu:', err);
          }
          return res.redirect('/');
        });
      } else {
        return res.render('authorization/reset.ejs', { layout: false });
      }
    } else {
      return res.redirect('/login');
    }
  });
}

module.exports = resetPage;
