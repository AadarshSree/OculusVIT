
const dotenv = require('dotenv').config()

const express = require('express')
const app = express()
const bcrypt = require('bcrypt')

const initializePassport = require('./passport-cfg')
const passport = require('passport')

const flash = require('express-flash')
const session = require('express-session')



let users = []

function findUser(uza){

    for( let i = 0; i<users.length; i++){
        if(users[i].username == uza)
                return users[i]
    }
}

initializePassport(passport, 
    findUser,
    (id) => { return users.find(user => user.id === id)}
)

app.set('view-engine', 'ejs')

app.use(flash())
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false

}))

app.use(passport.initialize())
app.use(passport.session())


app.use(express.urlencoded({
    extended: false
}))

app.get('/', checkAuth ,(req, res) => {
    res.render('index.ejs', {
        name: req.user.username
    })
})

app.get('/login', (req, res) => {
    res.render('login.ejs')
})

app.get('/register', (req, res) => {
    res.render('register.ejs')
})

app.post('/login' , passport.authenticate('local' , {
    successRedirect: '/',
    failureRedirect: '/login',
    failureFlash: true
}) )

app.post('/register', async (req, res) => {

    try {

        let passwd = await bcrypt.hash(req.body.password, 1)

        users.push({
            id: Date.now().toString(),
            username: req.body.uname,
            pass: passwd,
            age: req.body.age
        })

        res.redirect('/login')


    } catch (e) {
        res.redirect('/register')

    }

    console.log(users)
})

app.post('/logout' , (req,res) => {
    req.logOut()   
    res.redirect('/login')
})

function checkAuth(req, res, next) {

    if(req.isAuthenticated()){
        return next()
    }
    
    res.redirect('/login')
    
}
app.listen(3030)