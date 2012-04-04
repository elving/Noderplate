auth = require '../models/auth'

module.exports.index = (req, res) ->
    if auth.isLoggedin()
        res.render 'index'
    else
        res.render 'login', message: 'This is the login page.'

