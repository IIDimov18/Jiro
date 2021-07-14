var express = require('express');
const bcrypt = require("bcrypt");
const db = require('../classes/db');
const { body, validationResult } = require('express-validator');
var router = express.Router();


let DB = new db();

router.get('/', (req, res, next) => {
    console.log(req.session);
    let formattedErrors = {};
    res.render('createTeam', { body, formattedErrors});
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

        let salt = await bcrypt.genSalt();
        let hashedPassword = await bcrypt.hash(body.password,salt);


        let result  = await DB.registerUser(body.firstName,
            body.lastName,
            body.username,
            hashedPassword,
            salt,
            typeof body.isAdmin === 'undefined' ? 0 : 1,
            'nqkavToken');

        if(typeof result[0].Success !== 'undefined'){

            let body = {};
            return res.render('createUser',{formattedErrors,body});

        }else{

            formattedErrors = {username : 'There is already user with that username'};
            return res.render('createUser',{formattedErrors, body});

        }
    });
module.exports = router;
