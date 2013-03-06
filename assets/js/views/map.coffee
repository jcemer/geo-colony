App = window.App

class App.View.Map extends Backbone.View

	initialize: ->
		@collection.bind 'sync',   @onSync.bind(@)
		@collection.bind 'remove', @onRemoveTrail.bind(@)

		App.on 'focusTrail',       @onFocusTrail.bind(@)

		@map = new google.maps.Map @el, 
			center: new google.maps.LatLng(-30.391830328088137, -52.767333984375)
			zoom: 7
			mapTypeId: google.maps.MapTypeId.ROADMAP		

	onFocusTrail: (id) ->
		# console.log @collection.get(id)

	onRemoveTrail: (model, a, b) ->
		_.each model.get('mapPlots'), (plot) ->
			plot.setMap(null)

	onSync: (models) ->
		if models.each
			models.each @onSyncModel.bind(@)
		else
			@onSyncModel models

	onSyncModel: (model) ->
		plots = _.map model.get('plots'), (plot) =>
			paths = App.utils.coordsToLatLng(plot.plot_coordinates)
			plot = new google.maps.Polygon
				paths: paths,
				fillColor: model.get('color')
				strokeColor: model.get('color')
				strokeWeight: 1
			plot.setMap @map
			return plot
		model.set 'mapPlots', plots
