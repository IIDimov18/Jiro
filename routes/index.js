var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', (req, res, next) => {
  //console.log(document.cookie);
  console.log('index');
  res.render('index', { title: 'Express' });
});

module.exports = router;
