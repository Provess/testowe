
const connection = require('../../../database')

function answerQuestion(req, res) {
    if (!req.session.logged) return res.redirect('/')
    if (req.session.authorized == 0) return res.redirect('/')
    connection.query(`SELECT answer FROM questions WHERE id = ?`, [req.body.questionid], (err, result) => {
        if(err) throw err;
        if(result?.length) {
            if(result[0].answer == req.body.answer) {
                if(req.session.authorized == 0) return res.redirect('/')
                connection.query(`UPDATE core_users SET authorization = ? WHERE id = ?`, [req.session.authorized - 1, req.session.global_id], (err, result) => {
                    if(err) throw err;
                    return res.redirect('/question')
                })
            } else {
                return res.redirect('/question')
            }
        } else {
            return res.redirect('/')
        }
    })
}

module.exports = answerQuestion