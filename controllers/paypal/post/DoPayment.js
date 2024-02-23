const paypal = require('paypal-rest-sdk');

paypal.configure({
  mode: 'sandbox', 
  client_id: 'AVaJpgeM--xqw1xW_p4G-iT2kB2ogYWGqYucYvN9nzZk6uKdhy9VKtHVXOU1oACuWNn9XwG83x2vj4a7',
  client_secret: 'EO8DMWXIsFQYp5uv1N8AApc5K1CVGBXVHlJ3o6sptXjU8v87Gz06cFvOiVOrp1xCwMMXVS-J17qSzL_O',
});

async function processPayment(amount, description) {
  const paymentData = {
    intent: 'sale',
    payer: {
      payment_method: 'paypal',
    },
    transactions: [
      {
        amount: {
          total: amount,
          currency: 'PLN',
        },
        description: description,
      },
    ],
    redirect_urls: {
      return_url: 'https://ucp.la-rp.pl/paypal/success',
      cancel_url: 'https://ucp.la-rp.pl/paypal/cancel',
    },
  };
  const payment = await new Promise((resolve, reject) => {
    paypal.payment.create(paymentData, (error, payment) => {
      if (error) reject(error);
      resolve(payment);
    });
  });
  const approvalUrl = payment.links.find((link) => link.rel === 'approval_url').href;
  return approvalUrl;
}

function DoPayment(req, res) {
  if (!req.session.logged) return res.redirect('/login');
  if(!req.query.gamescore) {
    req.session.info = {
      "title": "Wystąpił problem",
      "message": "Nie wprowadzono kwoty gamescore"
    }
  }
  const baseAmountToPay = 6; 
  const gamescore = parseInt(req.query.gamescore, 10); 

  const isValidGamescore = !isNaN(gamescore) && gamescore >= 600 && gamescore % 100 === 0;

  const amountToPay = isValidGamescore ? (gamescore / 100).toString() : baseAmountToPay.toString();

  const description = 'Zakup gamescore: ' + (isValidGamescore ? gamescore : '600 (minimalne 6 PLN)');
  
  processPayment(amountToPay, description)
    .then(approvalUrl => res.redirect(approvalUrl))
    .catch(error => {
      console.error('Wystąpił błąd:', error);
      req.session.info = {
        "title": "Wystąpił problem",
        "message": "Wystąpił błąd podczas przetwarzania płatności."
      };
      res.redirect('/shop/');
    });
}

module.exports = DoPayment;
