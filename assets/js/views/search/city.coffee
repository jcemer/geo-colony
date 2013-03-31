App = window.App

class App.View.SearchCity extends Backbone.View
	initialize: ->
		@fieldName = @$('#search-city-name')

		(new AutoCompleteView
			minKeywordLength: 1
			input: @fieldName
			model: new App.Collection.SearchCities
		).render()

