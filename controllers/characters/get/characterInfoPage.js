const connection = require('../../../database')

function getVehicles(req) {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM srv_vehicles WHERE owneruid = ? AND ownertype = 0`, [req.query.id], (err, result) => {
        if (err) reject(err)
        resolve(result)
      });
    });
  }

  function getItems(req) {
    return new Promise((resolve, reject) => {
      connection.query(`SELECT * FROM srv_items WHERE owneruid = ? AND state = 0`, [req.query.id], (err, result) => {
        if (err) reject(err)
        resolve(result)
      });
    });
  }


function characterInfoPage(req, res) {
    const {type, id} = req.query
    if (!type || !id || (type !== "vehicles" && type !== "character" && type !== "items" && type !== "admin")) {
        return res.redirect('/');
      }      
    if(!req.session.logged) return res.redirect('/')
    connection.query(`SELECT * FROM srv_characters WHERE uid = ?`, [id], async (err, result) => {
        if(err) throw err;
        if(result?.length) {
            if(req.session.global_id == result[0].char_gid || req.session.admin > 0) {
                let character_info = result[0]
                // przedmioty, pojazdy
                const items = await getItems(req)
                const vehicles = await getVehicles(req)
                return res.render('dashboard/characters/characterInfo', {character_info: character_info, vehicles: vehicles, items: items})
            } else {
                return res.redirect('/')
            }
        } else {
            return res.redirect('/')
        }
    })
}

module.exports = characterInfoPage