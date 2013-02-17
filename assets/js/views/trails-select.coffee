App = window.App

App.View.TrailsSelect = Backbone.View.extend
    initialize: ->
        _.bindAll @, 'addOne', 'addAll'
        @collection?.bind 'reset', @addAll
    addOne: (model) ->
        view = new App.View.TrailOption model: model
        @views.push view
        @$el.append view.render().el
    addAll: ->
        _.each(@views, (view) -> view.remove())
        @views = []
        @collection.each @addOne

        disabled = @$el.children().length <= 1
        @$el.attr('disabled', disabled)
        @$el.trigger('disabled', disabled)