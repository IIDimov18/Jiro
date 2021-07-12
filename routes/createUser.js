var express = require('express');
const db = require('../classes/db');
const { body, validationResult } = require('express-validator');
var router = express.Router();


let DB = new db();
/* GET login page. */
router.get('/', (req, res, next) => {
  res.render('createUser', { title: 'Express' });
});


router.post('/',
body('username').isLength({ min: 5 }).bail().isLength({ max: 18 }).bail().isAlphanumeric(),
body('firstName').isAlpha(),
body('lastName').isAlpha(),
body('password').isLength({min: 7, max: 50}),
 (req, res, next) => {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
});
module.exports = router;
