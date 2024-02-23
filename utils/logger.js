
function logger(req, res, next){
   const debugObject = {
    'userdata': req.session,
    'ip': req.ip,
    'url': req.url
   }
   console.log(debugObject)
   next();
}

module.exports = logger;