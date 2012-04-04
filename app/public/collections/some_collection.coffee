module.exports = class SomeCollection extends Backbone.Collection
    model: require 'models/some_model'

    initialize: ->
        console.log 'SomeCollection initialized.'

        @add isAwesome: no