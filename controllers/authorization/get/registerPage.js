const recaptcha = require('../../../routes/recaptcha.js')

function registerPage(req, res) {
    if (req.session.logged == true) return res.redirect('/');
    const captcha = recaptcha.render();
    return res.render('authorization/register.ejs', { layout: false, captcha });
  }
  
  module.exports = registerPage;
  