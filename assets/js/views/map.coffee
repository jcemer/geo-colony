App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSync
		@collection.bind 'remove', @onRemoveTrail

		App.on 'focusTrail',       @onFocusTrail

		@map = new google.maps.Map @el, 
			center: new google.maps.LatLng(-30.391830328088137, -52.767333984375)
			zoom: 9#7
			mapTypeId: google.maps.MapTypeId.ROADMAP		

	onFocusTrail: (id) =>
		# console.log @collection.get(id)

	onRemoveTrail: (model, a, b) =>
		_.each model.get('mapPlots'), (plot) ->
			plot.setMap(null)

	onClickPlot: (model) =>
		console.log model.id

	addPlot: (model) =>
		color = model.get('livesIn').get('color')
		paths = App.utils.coordsToLatLng(model.get('plot_coordinates'))
		polygon = new google.maps.Polygon
			paths: paths,
			fillColor: color
			strokeColor: color
			strokeWeight: 1
		
		model.set('polygon', polygon)
		google.maps.event.addListener polygon, 'click', _.partial @onClickPlot, model
		polygon.setMap @map

	onSync: (models) =>
		if models.each
			models.each @onSyncModel
		else
			@onSyncModel models

	onSyncModel: (model) =>
		model.get('plots').each @addPlot
		# model.set 'plots', plots
