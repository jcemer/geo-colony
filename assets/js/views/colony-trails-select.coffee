App = window.App

class App.View.ColonyTrailsSelect extends Backbone.View
    initialize: ->
        @collection?.bind 'sync', @addAll.bind(@)
    
    addOne: (model) ->
        view = new App.View.ColonyTrailOption model: model
        @views.push view
        @$el.append view.render().el
    
    addAll: ->
        _.each(@views, (view) -> view.remove())
        @views = []
        @collection.each @addOne.bind(@)

        disabled = @$el.children().length <= 1
        @$el.attr('disabled', disabled)
        @$el.trigger('disabled', disabled)