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
		(new App.View.Map el: @$('#map'), collection: @collection).render()
		(new App.View.Trails el: @$('#trails'), collection: @collection).render()
		(new App.View.SearchTrail el: @$('#search-trail')).render()
		(new App.View.SearchLandholder el: @$('#search-landholder')).render()
		
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
		model = App.Model.Trail.findOrCreate id: id
		model.fetch() unless model.get("name")
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


