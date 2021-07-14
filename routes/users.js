var express = require('express');
const bodyParser = require('body-parser');
const db = require('../classes/db');
const { body, validationResult } = require('express-validator');
var router = express.Router();

let DB = new db();

/* GET users listing. */
router.get('/', async function(req, res, next) {
  let users = await DB.getUsers();

  res.render('users', {users});
});

router.post('/delete/:Id', async (req,res)=> {
    console.log('Test');
    if(typeof req.params.Id !== 'undefined'){
        await DB.deleteUser(req.params.Id);
    }
    res.redirect('back');
});
router.post('/',
    body('username').isLength({ min: 3, max: 18  }).withMessage('Username must be 3-18 characters').bail().isAlphanumeric().withMessage('Username can only contain numbers and english letters'),
    body('firstName').isAlpha().withMessage('First name can only contain english letters'),
    body('lastName').isAlpha().withMessage('Last name can only contain english letters'),
    async (req, res, next) => {
      let errors = validationResult(req);
      let body = req.body;
      let formattedErrors = {};

      if (!errors.isEmpty()) {

        for(const value of errors.errors){
          formattedErrors[value.param] = value.msg;
        }

        return res.render('createUser',{formattedErrors, body});

      }
        console.log(body);
      let result  = await DB.editUser(body.id,
          body.username,
          body.firstName,
          body.lastName,
          typeof body.isAdmin === 'undefined' ? 0 : 1,
          'nqkavToken');

      res.redirect('back');
    });

module.exports = router;
