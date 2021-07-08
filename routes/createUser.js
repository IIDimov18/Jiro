var express = require('express');
const db = require('../classes/db');
var router = express.Router();


let DB = new db();
/* GET login page. */
router.get('/', (req, res, next) => {
  res.render('createUser', { title: 'Express' });
});


router.post('/', (req, res, next) => {
  console.log(req.body);
});
module.exports = router;
