var express = require('express');
const bodyParser = require('body-parser');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource SLIVI 123');
});

router.post('/', function(req, res, next) {
  res.send('respond with a resource SLIVI 123');
});

module.exports = router;
