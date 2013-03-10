App = window.App

class App.View.ColonyTrailOption extends Backbone.View
    tagName: 'option'
    
    render: (event) ->
        @$el.attr('value', @model.id).html(@model.get('name'))
        return this