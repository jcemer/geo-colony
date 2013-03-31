App = window.App

class App.View.SearchLandholderTable extends Backbone.View
	template: _.template($('#search-landholder-table-template').html())
	events:
		'click li' : 'onItemClick'

	initialize: ->
		@collection.bind 'sync', @onSync
		@collection.bind 'reset', @onSync
	
	onSyncModel: (model) =>
		@$el.append @template data: model.toJSON()
	
	onSync: =>
		@$el.empty()
		@collection.each @onSyncModel

	onItemClick: (event) =>
		event.preventDefault()
		landholder_id = $(event.currentTarget).data('landholder_id')
		App.trigger 'addLand', 'L' + landholder_id