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
    body('name').isLength({ min: 3, max: 18  }).withMessage('Username must be 3-18 characters').bail().isAlphanumeric().withMessage('Name can only contain numbers and english letters'),
    async (req, res, next) => {
        let errors = validationResult(req);
        let body = req.body;
        let formattedErrors = {};

        if (!errors.isEmpty()) {



            for(const value of errors.errors){
                formattedErrors[value.param] = value.msg;
            }

            return res.render('createTeam',{formattedErrors, body});

        }
         
        let result  = await DB.registerTeam(body.name,
            req.session.Token);
            body={};
            return res.render('createTeam',{formattedErrors,body});

    });
module.exports = router;
 