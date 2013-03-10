App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSync
		@collection.bind 'remove', @removeTrail

		App.on 'focusTrail',       @onFocusTrail

	render: ->
		@map = new google.maps.Map @el, 
			center: new google.maps.LatLng(-30.391830328088137, -52.767333984375)
			zoom: 9#7
			mapTypeId: google.maps.MapTypeId.ROADMAP

	onFocusTrail: (id) =>
		# console.log @collection.get(id)

	removeTrail: (model) =>
		model.unset('plots')

	addPlot: (model) =>
		plot = new App.View.MapPlot map: @map, model: model
		plot.render()

	onSync: (models) =>
		if models.each
			models.each @onSyncModel
		else
			@onSyncModel models

	onSyncModel: (model) =>
		model.get('plots').each @addPlot
