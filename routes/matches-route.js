const express = require('express');
router = express.Router();
const db = require("../database");
const { promisify } = require('util');
const jwt = require('jsonwebtoken');
const authcontroler = require('../controller/auth');

router.get('/matches', async (req, res) => {
    const decoded = await promisify(jwt.verify)(req.cookies.cjwt, process.env.JWT_SECRET);
    const id = decoded.id;
  
    db.query('select * from desired_partner where email_id=?', [id], (error, check)=>{


        db.query('select * from basic_detail where email_id!=? AND gender=? AND age>=? AND age<=? AND height>=? AND height<=? AND martial_status=? AND country=? AND occupation=? AND religion=? AND annual_income>=? ', [id, check[0].gender, check[0].min_age,check[0].max_age,check[0].min_height,check[0].max_height,check[0].martial_status,check[0].country,check[0].occupation,check[0].religion,check[0].annual_income], (err, data) => {
console.log(data);
            res.render('matches',{data})
        });



    })






})


module.exports = router;