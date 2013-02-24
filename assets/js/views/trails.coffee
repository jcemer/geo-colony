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
		
		@collection.bind 'all', @isEmpty.bind(@)

		# storage
		@storage = new App.Storage('trails')
		@collection.bind 'add',    @addToStorage.bind(@)
		@collection.bind 'remove', @removeFromStorage.bind(@)
		@collection.bind 'reset',  @resetStorage.bind(@)
		@fetchStored()

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
		@list.empty()

	isEmpty: ->
		@$el.toggleClass('empty', !@collection.size())


	addToStorage: (model) ->
		@storage.add model.get('id')

	removeFromStorage: (model) ->
		@storage.remove model.get('id')

	resetStorage: (collection) ->
		@storage.reset()
		collection.each @addToStorage.bind(@)

	fetchStored: ->
		if @storage.itens.length
			@collection.fetch
				update: true
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


