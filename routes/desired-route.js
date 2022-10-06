const express = require('express');
router = express.Router();
const db = require("../database");
const { promisify } = require('util');
const jwt=require('jsonwebtoken');
const authcontroler = require('../controller/auth');
router.get('/desired', authcontroler.loggedin, (req, res) => {
    res.render('desired-profile'); 

})

router.post('/desired', async (req, res) =>{
        const decoded = await promisify(jwt.verify)(req.cookies.cjwt, process.env.JWT_SECRET);
        const id=decoded.id;
        const {gender ,min_age, max_age, religion, caste,min_height,max_height, occupation,mother_tongue, martial_status, country,annual_income} = req.body;
        console.log(id);
        console.log(gender);
                db.query('update desired_partner set gender = ?,min_age = ? , max_age = ? , religion = ? , caste = ? ,min_height = ? ,max_height = ? , occupation = ? ,mother_tongue = ? , martial_status = ? , country = ? ,annual_income = ?  where email_id =?',[ gender ,min_age, max_age, religion, caste,min_height,max_height, occupation,mother_tongue, martial_status, country,annual_income,id], (err, result) => {
                    if (err) {
                        console.log(err);
                    }
                    else {
                        console.log(result);
                        res.redirect('/')
                    }
                });
        
        




    })
    

module.exports = router;