App = window.App

class App.View.Trails extends Backbone.View
	template: _.template($('#trails-list-template').html())

	initialize: ->
		@collection = new App.Collection.Trails
		@collection.bind 'sync', @onSync.bind(@)

		# add / remove
		@list = @$('.trails-list')
		App.on 'addTrail', @onAddTrail.bind(@)
		@list.on 'click', '.remove-link', @onRemoveTrail.bind(@)
		
		# storage
		@storage = new App.Storage('trails')
		@collection.bind 'add',    @addToStorage.bind(@)
		@collection.bind 'remove', @removeFromStorage.bind(@)
		@fetchStoredCollection()

	onAddTrail: (id) ->
		model = new App.Model.Trail id: id
		model.fetch()
		@collection.add model

	onRemoveTrail: (event) ->
		link = $(event.target)
		el = link.closest('.trail')
		el.remove()
		model = @collection.get el.data('trail_id')
		@collection.remove(model)


	addToStorage: (model) ->
		@storage.add model.get('id')

	removeFromStorage: (model) ->
		@storage.remove model.get('id')

	fetchStoredCollection: ->
		if @storage.itens.length
			@collection.fetch
				data: id: @storage.itens


	onSync: (models) ->
		if models.each
			models.each @addOne.bind(@)
		else
			@addOne(models)

	addOne: (model) ->
		data = model.toJSON()
		data.color = 'red'
		@list.append(@template(data))


