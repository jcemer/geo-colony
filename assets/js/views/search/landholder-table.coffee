App = window.App

class App.View.SearchLandholderTable extends Backbone.View
	events:
		'click li' : 'onItemClick'

	initialize: ->
		@collection.bind 'sync', @onSync
		@collection.bind 'reset', @onSync
	
	onSyncModel: (model) =>
		@$el.append '<li data-landholder_id="' + model.id + '">' + model.get('name') + '</li>'
	
	onSync: =>
		@$el.empty()
		@collection.each @onSyncModel

	onItemClick: (event) =>
		event.preventDefault()
		landholder_id = $(event.target).data('landholder_id')
		App.trigger 'addLand', 'L' + landholder_id