
const bcrypt = require('bcrypt')

const localStrat = require('passport-local').Strategy


function initialize(passport , getUser , getUserById){

    const authenticateUser = async (uname, password, done) => {

        const user = getUser(uname) // fix this
        
        //console.log("Given username: ",uname)

        console.log("This is the user:",user)
        if(user == null){
            return done(null, false, { message: "nope"})
        }

        try{

            bcrypt.compare(password, user.pass, function(err,result) {
                
                if(result == true){
                    console.log("corrrect passwordd...")
                    return done(null, user)
                }
                else{
                   
                    console.log("wrong passwordd...")
                    
                    return done(null , false, {message: "bad password "})

                }
            })

        }catch (e) {

            return done(e)
        }
        
    }

    passport.use(new localStrat( {usernameField : 'uname' , passwordField: 'password'} , authenticateUser ))

    passport.serializeUser( (user, done) => { done(null, user.id) } )
    passport.deserializeUser( (id, done) => {
        return done(null, getUserById(id)) 
    })
    
}

module.exports  = initialize;