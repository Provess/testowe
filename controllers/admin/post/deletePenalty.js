const { errorMonitor } = require('node-cache');
const connection = require('../../../database/')
const axios = require('axios')
function deletePenalty(req, res) {
if(!req.session.logged) return res.redirect('/login')
if(!req.query.id) return res.redirect('/acp/dashboard')
if (req.session.admin < 2) {
    req.session.info = { "title": "Wystąpił problem", "message": "Nie posiadasz do tego odpowiednich uprawnień" };
    return res.redirect('/acp/dashboard')
  }

function updatePenalties(id) {
    connection.query(`UPDATE penalties SET active = ?, admin = ? WHERE id = ?`, [0, req.session.username, req.query.id], (err, result) => {
        if(err) throw error;
        
    })
}

function getPlayerId(name) {
    return new Promise((resolve, reject) => {
    connection.query(`SELECT accountid FROM users WHERE name = ?`, [name], (err, result) => {
        if(err) reject (err)
        resolve(result[0].accountid)   
    }) 
    });
}

connection.query(`SELECT * FROM penalties WHERE id = ?`, [req.query.id], async (err, result) => {
    if(err) throw err;
    if(result?.length) {
        const playerId = await getPlayerId(result[0].name)
        if(result[0].type == 0) {
            updatePenalties(req.query.id)
            connection.query(`DELETE FROM bans WHERE name = ?`, [result[0].username], (err, result1) => {
                if(err) throw err;
                req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
                return res.redirect('/characters?uid=' + playerId)
            })
        } else
        if(result[0].type == 1) {
            updatePenalties(req.query.id)
            connection.query(`UPDATE users SET ajailed = ?, ajailtime = ? WHERE name = ?`, [0, 0, result[0].name], (err, result) => {
                if(err) throw err;
                req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
                return res.redirect('/characters?uid=' + playerId)
            })
        } else
        if(result[0].type == 2) {
            updatePenalties(req.query.id)
            connection.query(`UPDATE users SET warns = ? WHERE name = ?`, [0, result[0].name], (err, result) => {
                if(err) throw err;
                req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
                return res.redirect('/characters?uid=' + playerId)
            })
        } else
        if(result[0].type == 4) {
            updatePenalties(req.query.id)
            connection.query(`UPDATE users SET status = ? WHERE name = ?`, [1, result[0].name], (err, result) => {
                if(err) throw err;
                req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
                return res.redirect('/characters?uid=' + playerId)
            })
        } else
        if(result[0].type == 5){
            updatePenalties(req.query.id)
            req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
            return res.redirect('/characters?uid=' + playerId)
        } else
        if(result[0].type == 6) {
            updatePenalties(req.query.id)
            connection.query(`UPDATE users SET mutetime = ? WHERE name = ?`, [0, result[0].name], (err, result) => {
                if(err) throw err;
                req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
                return res.redirect('/characters?uid=' + playerId)
            })
        } else {

        updatePenalties(req.query.id)
        req.session.info = { "title": "Sukces", "message": "Dezaktywowano karę użytkownika." };
        return res.redirect('/characters?uid=' + playerId)
        }
    } else {
        req.session.info = { "title": "Wystąpił problem", "message": "Taka kara nie istnieje" };
        return res.redirect('/acp/dashboard')
    }
})
}
module.exports = deletePenalty;