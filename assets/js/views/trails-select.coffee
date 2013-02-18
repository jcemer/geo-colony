App = window.App

App.View.TrailsSelect = Backbone.View.extend
    
    initialize: ->
        @collection?.bind 'reset', @addAll.bind(@)
    
    addOne: (model) ->
        view = new App.View.TrailOption model: model
        @views.push view
        @$el.append view.render().el
    
    addAll: ->
        _.each(@views, (view) -> view.remove())
        @views = []
        @collection.each @addOne.bind(@)

        disabled = @$el.children().length <= 1
        @$el.attr('disabled', disabled)
        @$el.trigger('disabled', disabled)