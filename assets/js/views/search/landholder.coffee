App = window.App

class App.View.SearchLandholder extends Backbone.View
	events:
		'submit': 'onSubmit'

	initialize: ->
		@fieldName = @$('#search-landholder-name')

		@landholdersTableView = new App.View.SearchLandholderTable
			el: @$('#search-landholder-table')
			collection: new App.Collection.SearchLandholders

	onSubmit: (event) =>
		event.preventDefault()
		search = @fieldName.val()
		@landholdersTableView.collection.url = 'api/landholders/search?q=' + search
		@landholdersTableView.collection.fetch()

	# 	@trailsView = new App.View.SearchTrailsSelect 
	# 		el: @trail
	# 		collection: new App.Collection.TrailsSelect

	# 	@colony.on 'change', @onChangeSelectedColony
	# 	@button.on 'click',  @onUseButton

	# 

	# onUseButton: =>
	# 	trail_id = @trail.val()
	# 	unless trail_id is '-' or @button.attr('disabled')
	# 		App.trigger 'addTrail', trail_id

	# onDisabled: (event, data) =>
	# 	@button.attr('disabled', data)

