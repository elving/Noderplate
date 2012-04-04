stitch = require 'stitch'
stylus = require 'stylus'

module.exports = (app, express) ->
    app.configure ->
        app.register '.eco', require 'eco'
        app.set 'views', "#{__dirname}/views/templates"
        app.set 'view engine', 'eco'
        app.use express.logger()
        app.use express.bodyParser()
        app.use express.cookieParser()
        app.use express.session secret: process.env.SESSION_SECRET or 'x0_Noderplate_0x'
        app.use express.static "#{__dirname}/public"

    package = stitch.createPackage
        paths: ["#{__dirname}/public"]
        dependencies: [
            "#{__dirname}/public/vendor/jquery.js"
            "#{__dirname}/public/vendor/underscore.js"
            "#{__dirname}/public/vendor/backbone.js"
        ]

    app.get '/app.js', package.createServer()

    app.get '/styles/main.css', (req, res) ->
        stylus(require('fs').readFileSync "#{__dirname}/public/styles/main.styl", 'utf8')
        .set('compress', yes)
        .set('force', yes)
        .include("#{__dirname}/public/styles")
        .render (err, css) -> unless err
            res.writeHead 200, 'Content-Type': 'text/css'
            res.end css

    app.configure 'development', () ->
        app.use express.errorHandler(dumpExceptions: on, showStack: on)

    app.configure 'production', () ->
        app.use express.errorHandler()