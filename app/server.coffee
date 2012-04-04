express = require 'express'

app = express.createServer()

require('./config')(app, express) # Load app configurations
require('./router')(app) # Load app router

port = process.env.PORT or 3000

app.listen port, ->
    console.log "Listening on #{port}"