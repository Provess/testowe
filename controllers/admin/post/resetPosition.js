const connection = require('../../../database/');

function resetPosition(req, res) {
  if (!req.session.logged || req.session.admin < 1 || !req.query.id) {
    return res.redirect('/');
  }

  connection.query(`SELECT * FROM srv_characters WHERE uid = ?`, [req.query.id], (err, result) => {
    if (err) throw err;

    if (result?.length) {
      if (!req.body.location || !["1", "2", "3"].includes(req.body.location)) {
        req.session.info = {
          "title": "Wystąpił błąd",
          "message": "Niepoprawna lokalizacja"
        };
        return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
      }

      const locations = {
        1: { x: 1510.1094, y: -1661.7413, z: 252.2590 },
      };

      const selectedLocation = locations[req.body.location];
      const { x, y, z } = selectedLocation || { x: 0, y: 0, z: 0 };

      connection.query(`UPDATE srv_characters SET lastx = ?, lasty = ?, lastz = ?, virtualworld = ? WHERE uid = ?`, [x, y, z, 0, req.query.id], (err, result) => {
        if (err) throw err;
        req.session.info = {
          "title": "Ustawione koordynaty:",
          "message": `${x}, ${y}, ${z}`
        };
        return res.redirect(`/characters/info?id=${req.query.id}&type=admin`);
      });
    } else {
      return res.redirect('/');
    }
  });
}

module.exports = resetPosition;
