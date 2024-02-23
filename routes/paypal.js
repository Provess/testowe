const express = require('express')
const paypalApp = express.Router()


const successCallback = require('../controllers/paypal/get/success.js')
paypalApp.get('/success', successCallback);

paypalApp.get('/cancel', (req, res) => {
  if(!req.session.logged) return res.redirect('/login')
  req.session.info = {
    "title": "Wystąpił problem",
    "message": "Anulowano płatność"
  }
  return res.redirect('/shop/')
});

const DoPayment = require('../controllers/paypal/post/DoPayment.js')
paypalApp.get('/buy', DoPayment)


module.exports = paypalApp