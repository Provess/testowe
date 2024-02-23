const express = require('express')
const shopPages = express.Router()

const shopPage = require('../controllers/shop/get/shopPage.js')
shopPages.get('/', shopPage)

const buyItem = require('../controllers/shop/post/buyItem.js')
shopPages.post('/buy', buyItem)
module.exports = shopPages