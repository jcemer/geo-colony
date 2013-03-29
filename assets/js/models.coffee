App = window.App

Backbone.Relational.store.addModelScope(App)

App.Model.Trail = Backbone.RelationalModel.extend
    urlRoot: 'api/trails'
    relations: [
        type: Backbone.HasMany
        key: 'plots'
        relatedModel: 'Model.Plot'
        collectionType: 'Collection.Plots',
        reverseRelation:
            key: 'livesIn'
    ]

App.Collection.Trails = Backbone.Collection.extend
    url: 'api/trails'
    model: App.Model.Trail



App.Model.Plot = Backbone.RelationalModel.extend
    urlRoot: 'api/plots'
App.Collection.Plots = Backbone.Collection.extend
    url: 'api/plots'
    model: App.Model.Plot



App.Model.TrailOption = Backbone.Model.extend()
App.Collection.TrailsSelect = Backbone.Collection.extend
	model: App.Model.TrailOption
