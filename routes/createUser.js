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
body('username').isLength({ min: 5, max: 18  }).withMessage('Username must be 5-18 characters').bail().isAlphanumeric().withMessage('Username can only contain numbers and english letters'),
body('firstName').isAlpha().withMessage('First name can only contain english letters'),
body('lastName').isAlpha().withMessage('Last name can only contain english letters'),
body('password').isLength({min: 7, max: 50}).withMessage('password must be 7-50 characters'),
 (req, res, next) => {
  let errors = validationResult(req);
  let body = req.body;

  if (!errors.isEmpty()) {
    let formattedErrors = {};
    for(const value of errors.errors){
      formattedErrors[value.param] = value.msg;
    }
    console.log(req.body);
    return res.render('createUser',{formattedErrors, body});
    return res.status(400).json({ errors: formattedErrors });
  }
});
module.exports = router;
