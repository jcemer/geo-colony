App = window.App

class App.View.Trails extends Backbone.View
	template: _.template($('#trails-list-template').html())

	initialize: ->
		@collection.bind 'sync',   @onSync
		@collection.bind 'reset',  @onResetTrails
		@collection.bind 'remove', @onRemoveTrail
		@collection.bind 'all',    @checkEmpty

		@list = @$('.trails-list')
		@$el.on 'click', '.trail',               @focusTrail
		@$el.on 'click', '.remove-link',         @removeTrail
		@$el.on 'click', '.reset-trails-button', @resetTrails

	focusTrail: (event) =>
		el = $(event.currentTarget)
		App.trigger 'focusTrail', el.data('trail_id')

	removeTrail: (event) =>
		link = $(event.currentTarget)
		el = link.closest('.trail')
		App.trigger 'removeTrail', el.data('trail_id')

	resetTrails: =>
		App.trigger 'resetTrails'


	onResetTrails: =>
		@list.empty()

	onRemoveTrail: (model) =>
		id = model.id
		@list.find("[data-trail_id=#{id}]").remove()


	checkEmpty: =>
		@$el.toggleClass('empty', !@collection.size())

	onSync: (models) =>
		if models.each
			models.each @onSyncModel
		else
			@onSyncModel models

	onSyncModel: (model) =>
		data = model.toJSON()
		@list.append @template(data)


