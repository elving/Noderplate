utils = require 'common/utils'

module.exports = class AppView extends Backbone.View
    el: 'body'

    initialize: ->
        console.log 'AppView initialized.'

        SomeCollection = require 'collections/some_collection'
        noderplate.collections.SomeCollection = new SomeCollection()

        utils.doSomething()

        some_template = require 'views/templates/some_template'
        @$el.append some_template message: 'Hello! this is an eco template.'