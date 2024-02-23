const express = require('express');
const googleAuth = express.Router()

const speakeasy = require('speakeasy');
const connection = require('../database/')

const googleAuthGenQr = require('../controllers/google/post/googleAuthGenQr.js')
googleAuth.post('/google/generate', googleAuthGenQr)

const googleAuthCheck = require('../controllers/google/post/googleAuthCheck.js')
googleAuth.post('/google/generate/auth', googleAuthCheck)

const googleAuthLoginPage = require('../controllers/google/get/googleAuthLoginPage.js')
googleAuth.get('/google/login', googleAuthLoginPage)

const googleAuthLogin = require('../controllers/google/post/googleAuthLogin.js')
googleAuth.post('/google/login', googleAuthLogin);

const googleAuthDisable= require('../controllers/google/post/googleAuthDisable.js')
googleAuth.post('/google/disable', googleAuthDisable);

module.exports = googleAuth;