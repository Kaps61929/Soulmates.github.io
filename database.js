const sql=require("mysql");
const dotenv=require("dotenv");
dotenv.config({path:'./.env'});
const db=sql.createConnection({
    host:process.env.DATABASE_HOST,
user:process.env.DATABASE_USER,
password:process.env.DATABASE_PASSWORD,
database:process.env.DATABASE})
db.connect((err)=>{
    if(err){
        console.log(err);
    }
    else{
        console.log("Mysql Connnected");
    }
})
module.exports=db;