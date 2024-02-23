
const connection = require('../../../database')
const { random } = require('lodash')

function questions(req, res) {
    if (!req.session.logged) return res.redirect('/')
    if (req.session.authorized == 0) return res.redirect('/')

    const { id } = req.query

    connection.query(`SELECT * FROM questions`, (err, result) => {
        if (err) throw err;
        console.log(req.session.authorized)
        if (req.session.authorized == 3) {
            const serverQuestions = result.filter(question => question.type === 'serwer')
            const randomServerQuestion = serverQuestions[random(0, serverQuestions.length - 1)]
            return res.render('dashboard/question', { question: randomServerQuestion, layout: false})
        }
        if (req.session.authorized == 2) {
            const regulationQuestions = result.filter(question => question.type === 'regulamin')
            const randomRegulationQuestion = regulationQuestions[random(0, regulationQuestions.length - 1)]
            return res.render('dashboard/question', { question: randomRegulationQuestion, layout: false })
        }
        if (req.session.authorized == 1) {
            const otherQuestions = result.filter(question => question.type === 'inne')
            const randomOtherQuestion = otherQuestions[random(0, otherQuestions.length - 1)]
            return res.render('dashboard/question', { question: randomOtherQuestion, layout: false })
        }
    })
}

module.exports = questions