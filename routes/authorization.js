const express = require('express')
const authorization = express.Router()
const recaptcha = require('./recaptcha.js')

const {cache} = require('./apicache.js')

const loginPage = require('../controllers/authorization/get/loginPage.js')
authorization.get('/login', loginPage)

const loginPagePost = require('../controllers/authorization/post/login.js')
authorization.post('/login', loginPagePost)

const registerPage = require('../controllers/authorization/get/registerPage.js')
authorization.get('/register', registerPage)

const registerPost = require('../controllers/authorization/post/register.js')
authorization.post('/register', recaptcha.middleware.verify, registerPost);

const forgotPage = require('../controllers/authorization/get/forgotPage.js')
authorization.get('/forgot', forgotPage)

const resetPage = require('../controllers/authorization/get/resetPage.js')
authorization.get('/reset', resetPage)
const resetPassword = require('../controllers/authorization/post/resetPassword.js')
authorization.post('/reset', resetPassword)

const forgotPost = require('../controllers/authorization/post/sendForgot.js')
authorization.post('/forgot', forgotPost)

const submitRegister = require('../controllers/authorization/get/submitRegister.js')
authorization.get('/authorization/verify', submitRegister)

const submitRegisterPost = require('../controllers/authorization/post/submitRegister.js')
authorization.post('/authorization/verify', submitRegisterPost)

authorization.get('/logout', (req, res) => {
    cache.flushAll();
    req.session.destroy()
    return res.redirect('/login')
})

const questions = require('../controllers/authorization/get/questions.js')
authorization.get('/question', questions)

const questionsAnswer = require('../controllers/authorization/post/question.js')
authorization.post('/question', questionsAnswer)
module.exports = authorization