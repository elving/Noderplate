module.exports = (app) ->
    auth = require './views/auth'

    app.get '/', auth.index