module.exports = class SomeModel extends Backbone.Model
    defaults:
        isAwesome: yes

    initialize: ->
        console.log 'SomeModel initialized.'