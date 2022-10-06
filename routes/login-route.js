const express = require('express');

const db = require("../database");
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const authcontroler = require('../controller/auth');
const { promisify } = require('util');


router = express.Router();
router.get('/login', (req, res) => {
    res.render('login');

})


router.post('/login', (req, res) => {
    try {
        const email_id = req.body.email_id;
        const password = req.body.password;

        if (!email_id || !password) {
            return res.status(404).render('login', {
                message: "Please Enter Email or Password"
            })
        }

        db.query('select * from registered_user where email_id =?', [email_id], async (error, results) => {

            if (!results) {

                res.status(404).render('login', {
                    message: "Please Enter correct Email or Password"
                })

            }

            else if (!(await bcrypt.compare(password, results[0].password))) {
                res.status(404).render('login', {
                    message: "Please Enter correct Email or Password"
                })

            }
            else {
                var id = results[0].email_id;
                const token = jwt.sign({ id }, process.env.JWT_SECRET, {
                    expiresIn: process.env.JWT_EXPIRES_IN
                })

                const cookiesoptions = {
                    expires: new Date(
                        Date.now() + process.env.COOKIES_EXPIRES * 24 * 60 * 60 * 1000
                    ),
                    httpOnly: true
                }

                res.cookie('cjwt', token, cookiesoptions);

                res.status(200).redirect('/');

            }



        })


    }
    catch (err) {
        console.log(err);
    }
})
router.get('/', authcontroler.loggedin, async (req, res) => {
    const decoded = await promisify(jwt.verify)(req.cookies.cjwt, process.env.JWT_SECRET);
    const id = decoded.id;
    if (req.user) {
db.query('select * from desired_partner where email_id=?', [id], (e, check) => {
        db.query('select * from basic_detail where email_id=?', [id], (err, result) => {
            if (err) {
                console.log(err);
            }
            else {
                
            const gender=check[0].gender;
              
                db.query('select * from basic_detail where email_id !=? AND gender=?', [id,gender], (er, data )=> {
                   

               


                    res.render('main-page', { result, data });
                




                   
                })
            }
        })

    })
    }
    else {
        res.redirect('/login');
    }

});
router.get('/logout', authcontroler.logout);

module.exports = router;
