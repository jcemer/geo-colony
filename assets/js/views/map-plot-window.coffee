App = window.App

class App.View.MapPlotWindow extends Backbone.View
	tagName: 'div'

	initialize: ->
		@model.bind 'change', @onChange

	render: =>
		@$el.html """Dados Históricos

Número: #{@model.get('number')}
Colônia: Antônio Prado
Linha: 2 de Julho
Núcleo: -
Secção: -
Lado/Ala: -

Dados de Geoprocessamento

Área (real): 268.094 m2
Cidade atual (mais próxima): Novo Treviso
Elevação média (aproximada): 657 m""".replace(/\n/g, '<br>')

	onChange: =>
		console.log 'changed'
		@render()

		