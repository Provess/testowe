const express = require('express')
const dashboardPages = express.Router()
const connection = require('../database/')
const {cacheMiddleware} = require('./apicache.js')

const dashboardPage = require('../controllers/dashboard/get/dashboardPage.js')
dashboardPages.get('/', cacheMiddleware(15), dashboardPage)

const infoPage = require('../controllers/dashboard/get/infoPage.js')
dashboardPages.get('/info', infoPage)

const settingsPage = require('../controllers/dashboard/get/settingsPage.js')
dashboardPages.get('/settings', settingsPage)

const changepassword = require('../controllers/dashboard/post/changepassword.js')
dashboardPages.post('/changepassword', changepassword)

const changename = require('../controllers/dashboard/post/changename.js')
dashboardPages.post('/changename', changename)

const setstatus = require('../controllers/dashboard/post/setstatus.js')
dashboardPages.post('/setstatus', setstatus)


dashboardPages.get('/getCharacters', (req, res) => {
    if(!req.session.logged) return res.redirect('/login')
    connection.query(`SELECT name, status FROM users WHERE accountid = ?`, [req.session.global_id], (err, result) => {
        if(err) throw err;
        return res.send(result)
    })
})


dashboardPages.get('/houses', (req, res) => {
    if(!req.session.logged) return res.redirect('/login')
    connection.query(`SELECT posx, posy, posz, price, owner FROM houses WHERE posvw = 0`, (err, result) => {
        if(err) throw err;
        return res.send(result)
    })
})

dashboardPages.get('/map', (req, res) => {
    if(!req.session.logged) return res.redirect('/login')
    return res.render('map/map', {layout: false})
})
module.exports = dashboardPages