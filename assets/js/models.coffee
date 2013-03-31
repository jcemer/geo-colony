App = window.App

Backbone.Relational.store.addModelScope(App)

App.Model.Land = Backbone.RelationalModel.extend
    urlRoot: 'api/lands'
    relations: [
        type: Backbone.HasMany
        key: 'plots'
        relatedModel: 'Model.Plot'
        collectionType: 'Collection.Plots',
        reverseRelation:
            key: 'livesIn'
    ]

App.Collection.Lands = Backbone.Collection.extend
    url: 'api/lands'
    model: App.Model.Land


App.Model.Plot = Backbone.RelationalModel.extend
    urlRoot: 'api/plots'
App.Collection.Plots = Backbone.Collection.extend
    url: 'api/plots'
    model: App.Model.Plot


# Search

App.Model.SearchTrail = Backbone.Model.extend()
App.Collection.SearchTrails = Backbone.Collection.extend
    model: App.Model.SearchTrail

App.Model.SearchLandholder = Backbone.Model.extend()
App.Collection.SearchLandholders = Backbone.Collection.extend
	url: 'api/landholders/search'
	model: App.Model.SearchLandholder