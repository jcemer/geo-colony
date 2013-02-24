App = window.App

class App.View.SearchTrail extends Backbone.View
	events:
		'disabled': 'onDisabled'

	initialize: ->
		@colony = @$('#search-trail-colony')
		@trail  = @$('#search-trail-trail')
		@button = @$('#search-trail-button')

		@trailsView = new App.View.ColonyTrailsSelect 
			el: @trail
			collection: new App.Collection.ColonyTrails

		@colony.on 'change', @onChangeSelectedColony.bind(@)
		@button.on 'click',  @onUseButton.bind(@)

	onChangeSelectedColony: ->
		colony_id = @colony.val()
		if colony_id is '-'
			@trailsView.collection.reset()
		else
			@trailsView.collection.url = 'api/colonies/' + colony_id + '/trails'
			@trailsView.collection.fetch()

	onUseButton: ->
		trail_id = @trail.val()
		unless trail_id is '-' or @button.attr('disabled')
			App.trigger('addTrail', trail_id)

	onDisabled: (event, data) ->
		@button.attr('disabled', data)

