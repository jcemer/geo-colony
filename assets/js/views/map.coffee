App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSync.bind(@)

		@map = new google.maps.Map @el, 
			center: new google.maps.LatLng(-30.391830328088137, -52.767333984375)
			zoom: 7
			mapTypeId: google.maps.MapTypeId.ROADMAP		

	onSync: (models) ->
		if models.each
			models.each @onSyncModel.bind(@)
		else
			@onSyncModel models

	onSyncModel: (model) ->
		_.each model.get('plots'), (plot) =>
			paths = App.utils.coordsToLatLng(plot.plot_coordinates)

			polygon = new google.maps.Polygon
				paths: paths,
				fillColor: model.get('color')
				strokeColor: model.get('color')
				strokeWeight: 1

			polygon.setMap @map
