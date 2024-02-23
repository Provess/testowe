const paypal = require('paypal-rest-sdk');
const connection = require('../../../database/');

async function executePayment(paymentId, payerId) {
    return new Promise((resolve, reject) => {
        paypal.payment.execute(paymentId, { payer_id: payerId }, (error, payment) => {
            if (error) reject(error);
            resolve(payment);
        });
    });
}

async function success(req, res) {
    if (!req.session.logged) return res.redirect('/login');

    const payerId = req.query.PayerID;
    const paymentId = req.query.paymentId;
    if (!payerId || !paymentId) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Wystąpił błąd podczas przetwarzania płatności."
        };
        return res.redirect('/shop/');
    }

    try {
        const payment = await executePayment(paymentId, payerId);
        const amount = payment.transactions[0].amount.total * 100;
        console.log(amount)
        connection.query(`UPDATE accounts SET gamescore = gamescore + ? WHERE id = ?`, [amount, req.session.global_id], (err, result) => {
          if (err) throw err;
          req.session.info = {
              "title": "Sukces",
              "message": `Dodano ${amount} gamescore do twojego konta`
          };
          return res.redirect('/shop/');
      });      
    } catch (error) {
        req.session.info = {
            "title": "Wystąpił problem",
            "message": "Wystąpił błąd podczas przetwarzania płatności."
        };
        return res.redirect('/shop/');
    }
}

module.exports = success;
