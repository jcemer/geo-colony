App = window.App

App.View.TrailOption = Backbone.View.extend
    tagName: 'option'
    initialize: ->
        _.bindAll @, 'render'
    render: (event) ->
        @$el.attr('value', @model.get('id')).html(@model.get('name'))
        return this