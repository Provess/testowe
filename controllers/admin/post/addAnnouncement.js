const connection = require('../../../database')

function addAnnouncement(req, res) {
    if(!req.session.logged) return res.redirect('/')
    if(req.session.admin < 4) return res.redirect('/')
    if(!req.body.text){
        req.session.error = {
            "message": "Nic nie wpisałeś"
        }
        return res.redirect('/acp/announcements')
    }
    if(req.body.text.length > 121 || req.body.text.length < 5){
        req.session.error = {
            "message": "Nieprawidłowa ilość znaków, tekst musi być dłuższy od 5 i maksymalnie 121"
        }
        return res.redirect('/acp/announcements')
    }
    const date = new Date()
    connection.query(`INSERT INTO announcements(announcement, author, created) VALUES(?, ?, ?)`, [req.body.text, req.session.username, date] ,(err, result) => {
        if(err) throw err;
        return res.redirect('/acp/announcements')
    })
}

module.exports = addAnnouncement