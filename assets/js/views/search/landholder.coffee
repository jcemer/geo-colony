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

