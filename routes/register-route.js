const express = require('express');
router = express.Router();
const db = require("../database");

const bcrypt = require('bcryptjs');

router.get('/register', (req, res) => {
    res.render('register'); 

})
router.post('/register', (req, res) => {
    const { email_id, phone_no, gender, date_of_birth, password, name } = req.body;


    const confirmpassword = req.body.confirmpassword;
    db.query('select email_id from registered_user where email_id =?', [email_id], async (err, results) => {
        if (err) {
            console.log(err);
        }
        if (results.length > 0) {
            return res.render('register', {
                message: "Email is already in use"
            });
        }
        if (confirmpassword !== password) {
            return res.render('register', {
                message: "Password donot match" 
            });
        }

        let hashpassword = await bcrypt.hash(password, 8);
        db.query('insert into registered_user SET ?', { email_id, phone_no, gender, date_of_birth, password: hashpassword, name }, (err) => {
            if (err) {
                console.log(err);
            }
            else {
                return res.redirect('/login');
            }
        })
        db.query('insert into basic_detail  SET  ?',{email_id,name,gender}, (err) => {
            if (err) {
                console.log(err);
            }
            
        })
        db.query('insert into desired_partner  SET  ?',{email_id}, (err) => {
            if (err) {
                console.log(err);
            }
            
        })
    })
  
})

module.exports = router;
