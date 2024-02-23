const connection = require('../../../database');

let users, characters, totalCash = 0;

async function homePage(req, res) {
  if (!req.session.logged) return res.redirect('/login');
  connection.query(`SELECT id FROM core_users`, (err, result1) => {
    if (err) throw err;
    users = result1.length;
    connection.query(`SELECT uid, cash FROM srv_characters`, (err, result) => {
      if (err) throw err;
      characters = result;
      totalCash = characters.reduce((sum, character) => sum + character.cash, 0);
      connection.query('SELECT * FROM announcements ORDER BY created DESC LIMIT 2', (err, result) => {
        if (err) throw err;
        return res.render('dashboard/dashboard.ejs', { users: users, characters: characters, totalCash: totalCash, announcements: result});
      });
    });
  });
}

module.exports = homePage;
