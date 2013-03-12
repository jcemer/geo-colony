App = window.App

class App.View.Trails extends Backbone.View
	initialize: ->
		@collection.bind 'add',    @onAddTrail
		@collection.bind 'change', @onChangeTrail
		@collection.bind 'reset',  @onResetTrails
		@collection.bind 'remove', @onRemoveTrail
		@collection.bind 'all',    @onAllTrails

		@list = @$('.trails-list')
		@$el.on 'click', '.trail',               @focusTrail
		@$el.on 'click', '.remove-link',         @removeTrail
		@$el.on 'click', '.reset-trails-button', @resetTrails

	checkEmpty: =>
		@$el.toggleClass('empty', !@collection.size())

	# Trail
	# 
	trail: (model) =>
		@list.find("[data-trail_id=#{model.id}]")

	trailTemplate: _.template($('#trails-list-template').html())

	trailHtml: (model) =>
		@trailTemplate model.toJSON()

	# Trail events
	# 
	focusTrail: (event) =>
		el = $(event.currentTarget)
		App.trigger 'focusTrail', el.data('trail_id')

	removeTrail: (event) =>
		link = $(event.currentTarget)
		el = link.closest('.trail')
		App.trigger 'removeTrail', el.data('trail_id')

	resetTrails: =>
		App.trigger 'resetTrails'

	# Collection
	# 
	onAddTrail: (model) =>
		@list.append @trailHtml(model)

	onChangeTrail: (model) =>
		@trail(model).replaceWith @trailHtml(model)

	onResetTrails: =>
		@list.empty()

	onRemoveTrail: (model) =>
		@trail(model).remove()

	onAllTrails: =>
		@checkEmpty()