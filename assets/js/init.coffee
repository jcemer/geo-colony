App = window.App

new App.View.Main el: $('body')


# TODO: refactor

sidebar = $('#sidebar')

sidebar.on 'click', '.panel .header', ->
	$(this).closest('.panel').toggleClass('open')

options =
	center: new google.maps.LatLng(-30.391830328088137, -52.767333984375)
	zoom: 7
	mapTypeId: google.maps.MapTypeId.ROADMAP

map = new google.maps.Map $('#map')[0], options