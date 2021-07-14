var express = require('express');
const bcrypt = require("bcrypt");
let session = require('express-session')
const db = require('../classes/db');
const { body, validationResult } = require('express-validator');
var router = express.Router();

let DB = new db();

/* GET login page. */
router.get('/', (req, res, next) => {
    let formattedErrors = {};
  res.render('login', { body,formattedErrors});
});

router.post('/',
    body('username').isLength({ min: 3, max: 18  }).withMessage('Username must be 3-18 characters').bail().isAlphanumeric().withMessage('Username can only contain numbers and english letters'),
    body('password').isLength({min: 7, max: 50}).withMessage('password must be 7-50 characters'),
    async (req, res, next) => {
      let errors = validationResult(req);
      let body = req.body;
        let formattedErrors = {};

      if (!errors.isEmpty()) {



        for(const value of errors.errors){
          formattedErrors[value.param] = value.msg;
        }

        return res.render('login',{formattedErrors, body});

      }

      let salt = await DB.getSalt(body.username);
        console.log(salt);
      if(salt.length == 0){
        formattedErrors = {username : 'Incorrect credentials', password : 'Incorrect credentials'};
        return res.render('login',{formattedErrors,body});
      }
        console.log(body.password);
        console.log(salt[0].Salt);
      let hashedPassword = await bcrypt.hash(body.password,salt[0].Salt);
      let result = await DB.loginUser(body.username,hashedPassword);

      if (result.length == 0){
          formattedErrors = {username : 'Incorrect credentials', password : 'Incorrect credentials'};
          return res.render('login',{formattedErrors,body});
      }
        console.log(result[0].Token);


      req.session.Token = result[0].Token;
      req.session.isAdmin = result[0].isAdmin;

        console.log(req.session);
        return res.redirect('/');

    });

module.exports = router;
