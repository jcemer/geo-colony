App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSyncTrails
		@collection.bind 'change', @onChangeTrails
		@collection.bind 'reset',  @onResetTrails
		@collection.bind 'remove', @onRemoveTrail

		App.on 'zoomTrail',        @zoomTrail
		App.on 'openInfoWindow',   @openInfoWindow
		App.on 'closeInfoWindow',  @closeInfoWindow

	render: ->
		@map = new google.maps.Map @el, App.utils.mapInitialConfigs()
		google.maps.event.addListener @map, 'click', @onMapClick

	zoomTrail: (id) =>
		bounds = @trailBounds @collection.get(id)
		zoom = App.utils.getMapZoomByBounds @map, bounds
		@map.setCenter(bounds.getCenter())
		@map.setZoom(zoom)		

	trailBounds: (model) =>
		unless model.has('bounds')
			bounds = new google.maps.LatLngBounds()
			extend = _.bind(bounds.extend, bounds)
			model.get('plots').each (plot) ->
				_.each plot.get('google_coords'), extend
			model.set('bounds', bounds)
		model.get('bounds')
	
	# Map
	# 
	onMapClick: =>
		@closeInfoWindow()


	# Info Window
	# 
	closeInfoWindow: =>
		@infoWindow?.close()

	openInfoWindow: (view, position) =>
		@closeInfoWindow()
		@infoWindow = new InfoBox
			content: view.el
			position: position
			alignBottom: true
			pixelOffset: new google.maps.Size(0, -10)
			infoBoxClearance: new google.maps.Size(0, 50)
			boxClass: 'info-window'
			closeBoxLabel: 'Fechar'
			boxStyle:
				width: '350px'

		@infoWindow.open @map

	# Colection
	# 
	onChangeTrails: =>
		@closeInfoWindow()

	onRemoveTrail: (model) =>
		# hack to remove plots
		model.unset('plots')
	
	onResetTrails: (c, collection) =>
		@closeInfoWindow()
		_.each collection.previousModels, @onRemoveTrail

	onSyncTrails: (models) =>
		if models.each
			models.each @onSyncModelTrail
		else
			@onSyncModelTrail models

	onSyncModelTrail: (model) =>
		model.get('plots').each @addPlot
		@zoomTrail model.id

	addPlot: (model) =>
		paths = App.utils.coordsToLatLng(model.get('plot_coordinates'))
		model.set('google_coords', paths)
		(new App.View.MapPlot map: @map, model: model).render()

	
