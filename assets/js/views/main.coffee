App = window.App

class App.View.Main extends Backbone.View

	initialize: ->
		@colors = new App.Colors

		@collection = new App.Collection.Trails
		@collection.bind 'add', @onAdd.bind(@)

		App.on 'addTrail',    @addTrail.bind(@)
		App.on 'removeTrail', @removeTrail.bind(@)
		App.on 'resetTrails', @resetTrails.bind(@)

		# sub views
		@trails       = new App.View.Trails el: @$('#trails'), collection: @collection
		@searchTrails = new App.View.SearchTrail el: @$('#search-trail')
		
		# storage
		@storage = new App.Storage('trails')
		@collection.bind 'add',    @addToStorage.bind(@)
		@collection.bind 'remove', @removeFromStorage.bind(@)
		@collection.bind 'reset',  @resetStorage.bind(@)
		@fetchStored()

	onAdd: (model) ->
		console.log model
		model.set 'color', @colors.get()

	addTrail: (id) ->
		model = new App.Model.Trail id: id
		model.fetch()
		@collection.add model

	removeTrail: (id) ->
		model = @collection.get id
		@collection.remove model

	resetTrails: ->
		@collection.reset()


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


