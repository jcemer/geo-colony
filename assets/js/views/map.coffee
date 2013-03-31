App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSyncLands
		@collection.bind 'change', @onChangeLands
		@collection.bind 'reset',  @onResetLands
		@collection.bind 'remove', @onRemoveLand

		App.on 'zoomLand',        @zoomLand
		App.on 'openInfoWindow',   @openInfoWindow
		App.on 'closeInfoWindow',  @closeInfoWindow

	render: ->
		@map = new google.maps.Map @el, App.utils.mapInitialConfigs()
		google.maps.event.addListener @map, 'click', @onMapClick

	zoomLand: (id) =>
		bounds = @landBounds @collection.get(id)
		zoom = App.utils.getMapZoomByBounds @map, bounds
		@map.setCenter(bounds.getCenter())
		@map.setZoom(zoom)		

	landBounds: (model) =>
		unless model.has('bounds')
			bounds = new google.maps.LatLngBounds()
			extend = _.bind(bounds.extend, bounds)
			model.get('plots').each (plot) ->
				_.each plot.get('google_coords'), extend
			model.set('bounds', bounds)
		model.get('bounds')
	
	# Map
	onMapClick: =>
		@closeInfoWindow()


	# Info Window
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
	onChangeLands: =>
		@closeInfoWindow()

	onRemoveLand: (model) =>
		# hack to remove plots
		model.unset('plots')
	
	onResetLands: (c, collection) =>
		@closeInfoWindow()
		_.each collection.previousModels, @onRemoveLand

	onSyncLands: (models) =>
		if models.each
			models.each @onSyncModelLand
		else
			@onSyncModelLand models

	onSyncModelLand: (model) =>
		model.get('plots').each @addPlot
		@zoomLand model.id

	addPlot: (model) =>
		paths = App.utils.coordsToLatLng(model.get('plot_coordinates'))
		model.set('google_coords', paths)
		(new App.View.MapPlot map: @map, model: model).render()

	
