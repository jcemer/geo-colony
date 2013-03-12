App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSyncTrails
		@collection.bind 'change', @onChangeTrails
		@collection.bind 'reset',  @onResetTrails
		@collection.bind 'remove', @onRemoveTrail

		App.on 'focusTrail',       @focusTrail
		App.on 'openInfoWindow',   @openInfoWindow
		App.on 'closeInfoWindow',  @closeInfoWindow

	render: ->
		@map = new google.maps.Map @el, 
			center: new google.maps.LatLng(-30.391830328088137, -52.767333984375)
			zoom: 9#7
			mapTypeId: google.maps.MapTypeId.ROADMAP

		google.maps.event.addListener @map, 'click', @onMapClick

	focusTrail: (id) =>
		# console.log @collection.get(id)
	
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
			boxClass: 'info-window'
			closeBoxLabel: 'Fechar'
			boxStyle:
				width: '280px'

		@infoWindow.open @map

	# Colection
	# 
	onChangeTrails: =>
		@closeInfoWindow()

	onRemoveTrail: (model) =>
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

	addPlot: (model) =>
		plot = new App.View.MapPlot map: @map, model: model
		plot.render()

	
