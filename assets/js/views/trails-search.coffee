exports = window.App

exports.View.TrailOption = Backbone.View.extend
	tagName: 'option'
	initialize: ->
		_.bindAll @, 'render'
	render: (event) ->
		@$el.attr('value', @model.get('id')).html(@model.get('name'))
		return this


exports.View.TrailsSelect = Backbone.View.extend
	initialize: ->
		_.bindAll @, 'addOne', 'addAll'
		@collection?.bind 'reset', @addAll
	addOne: (model) ->
		view = new exports.View.TrailOption model: model
		@views.push view
		@$el.append view.render().el
	addAll: ->
		_.each(@views, (view) -> view.remove())
		@views = []
		@collection.each @addOne
		@$el.attr('disabled', @$el.children().length <= 1)


exports.View.TrailsSearch = Backbone.View.extend
	initialize: ->
		_.bindAll @, 'changeSelectedColony'

		@colony = $('#search-colonies-colony')
		@trail = $('#search-colonies-trail')

		@trailsSelectView = new exports.View.TrailsSelect 
			el: @trail
			collection: new exports.Collection.Trails

		@colony.on 'change', @changeSelectedColony

	changeSelectedColony: ->
		@trailsSelectView.collection.url = 'api/colonies/' + @colony.val() + '/trails'
		@trailsSelectView.collection.fetch()
