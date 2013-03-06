App = window.App

class App.View.Trails extends Backbone.View
	template: _.template($('#trails-list-template').html())

	initialize: ->
		@collection.bind 'sync',   @onSync.bind(@)
		@collection.bind 'reset',  @onResetTrails.bind(@)
		@collection.bind 'remove', @onRemoveTrail.bind(@)
		@collection.bind 'all',    @checkEmpty.bind(@)

		@list = @$('.trails-list')
		@$el.on 'click', '.trail',               @focusTrail.bind(@)
		@$el.on 'click', '.remove-link',         @removeTrail.bind(@)
		@$el.on 'click', '.reset-trails-button', @resetTrails.bind(@)

	focusTrail: (event) ->
		el = $(event.currentTarget)
		App.trigger 'focusTrail', el.data('trail_id')

	removeTrail: (event) ->
		link = $(event.currentTarget)
		el = link.closest('.trail')
		App.trigger 'removeTrail', el.data('trail_id')

	resetTrails: ->
		App.trigger 'resetTrails'


	onResetTrails: ->
		@list.empty()

	onRemoveTrail: (model) ->
		id = model.get('id')
		@list.find("[data-trail_id=#{id}]").remove()


	checkEmpty: ->
		@$el.toggleClass('empty', !@collection.size())

	onSync: (models) ->
		if models.each
			models.each @onSyncModel.bind(@)
		else
			@onSyncModel models

	onSyncModel: (model) ->
		data = model.toJSON()
		@list.append @template(data)


