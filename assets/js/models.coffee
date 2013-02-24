App = window.App

App.Model.Trail = Backbone.Model.extend
    urlRoot: 'api/trails'
App.Collection.Trails = Backbone.Collection.extend
    url: 'api/trails'
    model: App.Model.Trail


App.Model.ColonyTrail = Backbone.Model.extend
    url: ''
App.Collection.ColonyTrails = Backbone.Collection.extend
	model: App.Model.ColonyTrail