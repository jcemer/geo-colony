App = window.App

App.Model.Land = Backbone.Model.extend
	urlRoot: 'api/lands'
App.Collection.Lands = Backbone.Collection.extend
	url: 'api/lands'
	model: App.Model.Land

App.Model.Plot = Backbone.Model.extend
	urlRoot: 'api/plots'
App.Collection.Plots = Backbone.Collection.extend
	url: 'api/plots'
	model: App.Model.Plot


# Search

App.Model.SearchTrail = Backbone.Model.extend()
App.Collection.SearchTrails = Backbone.Collection.extend
	model: App.Model.SearchTrail

App.Model.SearchCity = Backbone.Model.extend
	label: -> @.get 'name'
App.Collection.SearchCities = Backbone.Collection.extend
	url: 'api/cities/search'
	model: App.Model.SearchCity

App.Model.SearchLandholder = Backbone.Model.extend()
App.Collection.SearchLandholders = Backbone.Collection.extend
	url: 'api/landholders/search'
	model: App.Model.SearchLandholder