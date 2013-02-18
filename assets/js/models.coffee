App = window.App

App.Model.Trail = Backbone.Model.extend
	urlRoot: 'api/trails'

App.Collection.Trails = Backbone.Collection.extend
	model: App.Model.Trail