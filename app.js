const express = require('express')
const helmet = require('helmet')
const sequelize = require('./conexion')
const bodyParser = require('body-parser')
const cors = require('cors')
const PORT = 3000

//require Routes
const authRouter = require('./routers/auth.routes')
const mealsRouter = require('./routers/meals.routes')
const usersRouter = require('./routers/users.routes')
const orderRoutes = require('./routers/orders.routes')

//Middleware
const app = express()
app.use(helmet())
app.use(cors())

// capture body
// cambiar bode-parser por express.bodyparser 
app.use(bodyParser.urlencoded({ extended: false })) //revisar
app.use(bodyParser.json())


// route middlewares
app.use('/v1/api/auth', authRouter)
app.use('/v1/api/meals', mealsRouter)
app.use('/v1/api/users', usersRouter)
app.use('/v1/api/orders', orderRoutes)


app.listen(PORT, () =>{
    console.log(`Server started in the PORT ${PORT}`);
})


module.exports = app