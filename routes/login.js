var express = require('express');
var router = express.Router();

/* GET login page. */
router.get('/', (req, res, next) => {
  res.render('login', { title: 'Express' });
});

module.exports = router;