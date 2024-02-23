const Recaptcha = require('express-recaptcha').RecaptchaV2;
const recaptcha = new Recaptcha('6LfnqeomAAAAALOjunDBnCo37bCfZTBa9RGbmR6Q', '6LfnqeomAAAAAAG982ZxT3eIT6xHlh11ra9N8nrz');

module.exports = recaptcha