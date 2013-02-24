App = window.App

class App.View.Trails extends Backbone.View
	template: _.template($('#trails-list-template').html())

	initialize: ->
		@collection = new App.Collection.Trails
		@collection.bind 'sync', @addAll.bind(@)

		# add / remove / destroy
		@list = @$('.trails-list')
		App.on 'addTrail', @onAddTrail.bind(@)
		@$el.on 'click', '.remove-link', @onRemoveTrail.bind(@)
		@$el.on 'click', '.reset-trails-button', @onResetTrails.bind(@)
		
		# storage
		@storage = new App.Storage('trails')
		@collection.bind 'add',    @addToStorage.bind(@)
		@collection.bind 'remove', @removeFromStorage.bind(@)
		@collection.bind 'reset',  @resetStorage.bind(@)
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

	onResetTrails: ->
		@collection.reset()
		@list.html('')


	addToStorage: (model) ->
		@storage.add model.get('id')

	removeFromStorage: (model) ->
		@storage.remove model.get('id')

	resetStorage: (model) ->
		@storage.reset()

	fetchStoredCollection: ->
		if @storage.itens.length
			@collection.fetch
				data: id: @storage.itens


	addAll: (models) ->
		if models.each
			models.each @addOne.bind(@)
		else
			@addOne(models)

	addOne: (model) ->
		data = model.toJSON()
		data.color = 'red'
		@list.append(@template(data))


