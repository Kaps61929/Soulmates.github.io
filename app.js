const express=require("express");
const path=require("path");
const cookieparser=require('cookie-parser')

const app =express();

const server =require("http").createServer(app);
const publicdirectory=path.join(__dirname,"./public");
const publicdirectory2=path.join(__dirname,"./images");
app.set('view engine','hbs');
app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(cookieparser());



app.use(express.static(publicdirectory));
app.use(express.static(publicdirectory2));


app.use('/',require("./routes/register-route"))
app.use('/',require("./routes/login-route"))
app.use('/',require('./routes/myprofile-route'))
app.use('/',require("./routes/desired-route"))
app.use('/',require("./routes/matches-route"))

server.listen(5001,()=>{
    console.log("server started");
})
