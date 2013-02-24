App = window.App

class App.View.Trails extends Backbone.View
    template: _.template($('#trails-list-template').html())

    initialize: ->
        @collection = new App.Collection.Trails
        @list = @$('.trails-list')

        App.on 'addTrail', @onAddTrail.bind(@)
        @list.on 'click', '.remove-link', @onRemoveTrail.bind(@)

        @collection.bind 'sync', @addAll.bind(@)
        @loadStorage()

    onAddTrail: (id) ->
        model = new App.Model.Trail id: id, color: 'yellow'
        model.fetch()
        @collection.add model

    onRemoveTrail: (event) ->
        link = $(event.target)
        el = link.closest('.trail')
        el.remove()
        model = @collection.get el.data('trail_id')
        model.destroy()

    loadStorage: ->
        @collection.fetch({
            data: {
                id: [17, 23, 24]
            }
        })

    addAll: (models) ->
        if models.each
            models.each @addOne.bind(@)
        else
            @addOne(models)

    addOne: (model) ->
        data = model.toJSON()
        data.color = 'red'
        @list.append(@template(data))


