App = window.App

new App.View.TrailsSearch el: $('#trails-search')





# TODO: refactor

sidebar = $('#sidebar')

sidebar.on 'click', '.panel .header', ->
	$(this).closest('.panel').toggleClass('open')

options =
	center: new google.maps.LatLng(-34.397, 150.644)
	zoom: 8
	mapTypeId: google.maps.MapTypeId.ROADMAP

map = new google.maps.Map document.getElementById('map'), options