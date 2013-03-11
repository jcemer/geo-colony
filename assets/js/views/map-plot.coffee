App = window.App

class App.View.MapPlot extends Backbone.View

	initialize: (options) ->
		@map = options.map
		@model.bind 'remove', @onRemove

	render: =>
		color = @model.get('livesIn').get('color')
		paths = App.utils.coordsToLatLng(@model.get('plot_coordinates'))
		@el = new google.maps.Polygon
			paths: paths,
			fillColor: color
			strokeColor: color
			strokeWeight: 1

		google.maps.event.addListener @el, 'click', @onClick
		@el.setMap @map

	remove: =>
		@el.setMap null

	onRemove: =>
		@remove()

	onClick: (event) =>
		App.trigger 'openInfoWindow', @model.id, event.latLng

		