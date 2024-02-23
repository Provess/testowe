const express = require('express');
const acp = express.Router()

const usersPage = require('../controllers/admin/get/users.js')
acp.get('/users', usersPage)

const charactersPage = require('../controllers/admin/get/characters.js')
acp.get('/characters', charactersPage)

const announcementsPage = require('../controllers/admin/get/announcements.js')
acp.get('/announcements', announcementsPage)

const addAnnouncement = require('../controllers/admin/post/addAnnouncement.js')
acp.post('/addannouncement', addAnnouncement)

const updateUser = require('../controllers/admin/post/updateUser.js')
acp.post('/update', updateUser)

const activateUser = require('../controllers/admin/post/activateUser.js')
acp.post('/activate', activateUser)

const ticketList = require('../controllers/admin/get/ticketList.js')
acp.get('/list', ticketList)

const resetPosition = require('../controllers/admin/post/resetPosition.js')
acp.post('/reset', resetPosition)

const blockCharacter = require('../controllers/admin/post/blockCharacter.js')
acp.post('/block', blockCharacter)

const warnCharacter = require('../controllers/admin/post/warnCharacter.js')
acp.post('/warn', warnCharacter)

const vehiclesPage = require('../controllers/admin/get/vehicles.js')
acp.get('/vehicles', vehiclesPage)

const banUser = require('../controllers/admin/post/banUser.js')
acp.post('/ban', banUser)

const logsPage = require('../controllers/admin/get/logsPage.js')
acp.get('/logs', logsPage)

const dashboard = require('../controllers/admin/get/dashboard.js')
acp.get('/dashboard', dashboard)

const serverSettings = require('../controllers/admin/post/serverSettings.js')
acp.post('/serversettings', serverSettings)

const deletePenalty = require('../controllers/admin/post/deletePenalty.js')
acp.post('/deletepenalty', deletePenalty)
module.exports = acp