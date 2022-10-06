const { promisify } = require('util');
const jwt=require('jsonwebtoken');
const db = require('../database');


exports.loggedin = async (req, res, next) => {

    if (req.cookies.cjwt) {
        try {
            const decoded = await promisify(jwt.verify)(req.cookies.cjwt, process.env.JWT_SECRET)
            
            db.query('select*from registered_user where email_id=?',[ decoded.id], (err, result) => {
               console.log(decoded.id);
                if (!result) {
                    return next();
                }
                req.user = result[0];
                return next();

            })




        }
        catch (error) {
            console.log(error);
        }
    }



    else {
        next()
    }
}
exports.logout= async(req,res)=>{
    try{
        
    res.cookie('cjwt','logout',{
        expires:new Date(Date.now()+2*1000)
    })
res.status(200).redirect('/login');}
catch(err){
    console.log(err);
}
}
