const express = require('express');
router = express.Router();
const path = require("path");
const db = require("../database");
const { promisify } = require('util');
const multer = require('multer');
const jwt = require('jsonwebtoken');
const authcontroler = require('../controller/auth');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './images')
    },
    filename: (req, file, cb) => {
       
        cb(null, Date.now() + path.extname(file.originalname))
    }
})

const upload = multer({ storage: storage });
router.get('/myprofile', authcontroler.loggedin, (req, res) => {
    res.render('myprofile');

})


router.post('/myprofile', upload.single('photo'), async (req, res) => {




    const decoded = await promisify(jwt.verify)(req.cookies.cjwt, process.env.JWT_SECRET);
    const id = decoded.id;
    var img;
    if(req.file){
    img= req.file.filename; 
    }
    

    

    const { martial_status, age, height, religion, caste, mother_tongue, degree, occupation, annual_income, country, address, about_me } = req.body;


    db.query('update basic_detail set martial_status=? ,age=?, height=?, religion=?, caste=?, mother_tongue=?, degree=?, occupation=?, annual_income=?, country=?, address=?, about_me=?, photo=? where email_id =?', [martial_status, age, height, religion, caste, mother_tongue, degree, occupation, annual_income, country, address, about_me,img, id], (err, result) => {
        if (err) {
            console.log(err);
        }
        else {
            console.log(result);
            res.redirect('/');
        }
    });
    


})

    


module.exports = router;