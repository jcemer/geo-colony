App = window.App

App.View.TrailsSearch = Backbone.View.extend
	events:
		'disabled': 'disabled'

	initialize: ->
		@colony = @$('#trails-search-colony')
		@trail  = @$('#trails-search-trail')
		@button = @$('#trails-search-button')

		@trailsSelectView = new App.View.TrailsSelect 
			el: @trail
			collection: new App.Collection.Trails

		@colony.on 'change', @changeSelectedColony.bind(@)

	changeSelectedColony: ->
		colony_id = @colony.val()
		if colony_id is '-1'
			@trailsSelectView.collection.reset()
		else
			@trailsSelectView.collection.url = 'api/colonies/' + colony_id + '/trails'
			@trailsSelectView.collection.fetch()

	disabled: (event, data) ->
		@button.attr('disabled', data)

