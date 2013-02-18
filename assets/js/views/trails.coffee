App = window.App

App.View.Trails = Backbone.View.extend
    template: _.template($('#trails-list-template').html())

    initialize: ->
        @collection = new App.Collection.Trails
        @list = @$('.trails-list')

        @collection?.bind 'sync', @addAll.bind(@)
        model = new App.Model.Trail id: 17, color: 'red'
        model.fetch()
        @collection.add model

    addAll: ->
        @list.html('')
        @collection.each @addOne.bind(@)

    addOne: (model) ->
        @list.append(@template(model.toJSON()))


