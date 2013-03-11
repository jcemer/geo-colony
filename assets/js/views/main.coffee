App = window.App

class App.View.Main extends Backbone.View

	initialize: ->
		@colors = new App.utils.Colors

		@collection = new App.Collection.Trails
		@collection.bind 'add', @onAddTrail

		App.on 'addTrail',    @addTrail
		App.on 'removeTrail', @removeTrail
		App.on 'resetTrails', @resetTrails

		# sub views
		@map = new App.View.Map el: @$('#map'), collection: @collection
		@map.render()

		@trails = new App.View.Trails el: @$('#trails'), collection: @collection
		@trails.render()

		@searchTrails = new App.View.SearchTrail el: @$('#search-trail')
		@searchTrails.render()
		
		# storage
		@storage = new App.Storage('trails')
		@collection.bind 'add',    @addToStorage
		@collection.bind 'remove', @removeFromStorage
		@collection.bind 'reset',  @resetStorage
		@fetchStored()

	# Trails
	#
	onAddTrail: (model) =>
		model.set 'color', @colors.get()


	# Global events to trails
	#
	addTrail: (id) =>
		model = new App.Model.Trail id: id
		model.fetch()
		@collection.add model

	removeTrail: (id) =>
		model = @collection.get id
		@collection.remove model

	resetTrails: =>
		@collection.reset()

	# Storage
	#
	addToStorage: (model) =>
		@storage.add model.id

	removeFromStorage: (model) =>
		@storage.remove model.id

	resetStorage: (collection) =>
		@storage.reset()
		collection.each @addToStorage

	fetchStored: =>
		if @storage.itens.length
			@collection.fetch
				update: true
				data: id: @storage.itens


