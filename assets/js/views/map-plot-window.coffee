App = window.App

class App.View.MapPlotWindow extends Backbone.View
	tagName: 'article'
	template: _.template($('#map-plot-window-template').html())

	initialize: ->
		@model.bind 'change', @onChange

	render: =>
		@$el.html @template data: @model.toJSON()

	onChange: =>
		console.log 'changed'
		@render()

