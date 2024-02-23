const connection = require('../../../database')
function charactersPage(req, res) {
    const {uid} = req.query
    if(!req.session.logged) return res.redirect('/login')
    if(!uid) return res.redirect('/')
    
    async function getCharacterPenalties() {
        return new Promise((resolve, reject) => {
          connection.query(
            `SELECT * FROM srv_penalties WHERE penalty_user_global_id = ?`, [uid], (err, result) => {
              if (err) reject(err);
              resolve(result);
            }
          );
        });
      }
      
        connection.query(`SELECT id, username, ucp_status, admin, member_game_ban FROM core_users WHERE id = ?`, [uid], (err, result1) => {
            if(err) throw err;
            if(result1?.length) {
                connection.query(`SELECT * FROM srv_characters WHERE uid = ?`, [uid], async (err, result) => {
                    if(err) throw err;
                   const penalties = await getCharacterPenalties()
                    return res.render('dashboard/characters/characters.ejs', {characters: result, user: result1[0], penalties: penalties, status: result1[0].ucp_status, ban: result1[0].ucp_ban})
                })
            } else {
                req.session.info = {
                    "title": "Wystąpił błąd",
                    "message": "Nie ma takiego użytkownika"
                }
                return res.redirect('/')
            }
        })
}

module.exports = charactersPage