App = window.App

class App.View.MapPlotWindow extends Backbone.View
	tagName: 'article'
	template: _.template($('#map-plot-window-template').html())

	initialize: ->
		@model.bind 'change', @onChange
		@$el.on 'click', '.nav a', @nav

	render: =>
		@$el.html @template data: @model.toJSON()

	nav: (event) =>
		event.preventDefault()
		height = @$el.height()
		@$('.content').addClass('hide')
		@$('.nav a').removeClass('active')

		target = $(event.currentTarget)
		target.addClass('active')
		$(target.attr('href')).removeClass('hide').css('min-height', height)

	onChange: =>
		@render()

