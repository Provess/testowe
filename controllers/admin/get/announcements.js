const connection = require('../../../database')


function announcements(req, res) {
    if(!req.session.logged) return res.redirect('/')
    if(req.session.admin < 4) return res.redirect('/')
    connection.query(`SELECT * FROM announcements`, (err, result) => {
        if(err) throw err;
        return res.render('admin/announcements', {announcements: result})
    })
}

module.exports = announcements