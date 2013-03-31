App = window.App

class App.View.SearchLandholder extends Backbone.View
	template: _.template($('#search-landholder-table-template').html())
	events:
		'submit': 'onSubmit'
		'click a' : 'onItemClick'

	initialize: ->
		@fieldName = @$('#search-landholder-name')
		@table = @$('#search-landholder-table')

		@collection = new App.Collection.SearchLandholders
		@collection.bind 'sync', @onSync
		@collection.bind 'reset', @onSync

	onSubmit: (event) =>
		event.preventDefault()
		search = @fieldName.val()
		@collection.url = 'api/landholders/search?q=' + search
		@collection.fetch()

	onSyncModel: (model) =>
		@table.append @template data: model.toJSON()
	
	onSync: =>
		@table.empty()
		@collection.each @onSyncModel

	onItemClick: (event) =>
		event.preventDefault()
		landholder_id = $(event.currentTarget).data('landholder_id')
		App.trigger 'addLand', 'L' + landholder_id

