const express = require('express')
const ticketPages = express.Router()

const ticketList = require('../controllers/tickets/get/ticketList.js')
ticketPages.get('/list', ticketList)

const viewTicket = require('../controllers/tickets/get/viewTicket.js')
ticketPages.get('/view', viewTicket)

const ticketComment = require('../controllers/tickets/post/ticketComment.js')
ticketPages.post('/comment', ticketComment)

const createTicketPage = require('../controllers/tickets/get/createTicket.js')
ticketPages.get('/create', createTicketPage)

const createTicket = require('../controllers/tickets/post/createTicket.js')
ticketPages.post('/create', createTicket)

const closeTicket = require('../controllers/tickets/post/closeTicket.js')
ticketPages.post('/close', closeTicket)

module.exports = ticketPages