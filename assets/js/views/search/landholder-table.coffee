App = window.App

class App.View.SearchLandholderTable extends Backbone.View
	initialize: ->
		@collection.bind 'sync', @onSync
		@collection.bind 'reset', @onSync
	
	onSyncModel: (model) =>
		@$el.append '<li>' + model.get('name') + '</li>'
	
	onSync: =>
		@$el.empty()
		@collection.each @onSyncModel