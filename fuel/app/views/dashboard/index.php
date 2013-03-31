<div id="sidebar">
	<header>
		<h1 class="logo">Geo Colony</h1>
		<h2 class="title">Mapa das colônias <b>italianas</b> e <b>alemãs</b> no <b>Rio Grande do Sul</b></h2>
	</header>
	
	<div id="lands" class="empty">
		<script type="text/html" id="lands-template">
			<li class="land" data-land_id="<%= data.id %>" style="background-color: <%= data.color %>">
				<% if (data.name) { %>
					<span class="label"><%= data.name %></span>
				<% } else { %>
					<span class="label loading">carregando...</span>
				<% } %>
				<a href="#" class="remove-link" title="remover">remover</a>
			</li>
		</script>
		<ul class="lands-list"></ul>
		<div class="buttons">
			<button type="button" class="reset-lands-button button">limpar</button>
		</div>
	</div>
	
	<form action="" id="search-trail" class="panel">
		<h3 class="header">Colônias</h3>
		<div class="content">
			<fieldset>
				<ol>
					<li>
						<?php echo Form::label('Nome da colônia', 'colony', array('for' => 'search-trail-colony')); ?>
						<?php echo Form::select('colony', null, $colonies, array('id' => 'search-trail-colony')); ?>
					</li>
					<li>
						<?php echo Form::label('Nome da linha / travessão', 'trail', array('for' => 'search-trail-trail')); ?>
						<?php echo Form::select('trail', null, $trails, array('id' => 'search-trail-trail', 'disabled' => true)); ?>
					</li>
				</ol>
			</fieldset>
			<div class="buttons">
				<button id="search-trail-button" class="button" disabled>adicionar</button>
			</div>
		</div>
	</form>
	
	<div id="search-location" class="panel">
		<h3 class="header">Localidades</h3>
		<form action="" class="content">
			<fieldset>
				<ol>
					<li>
						<label for="">Nome da colônia</label>
						<select name="" id="">
							<option value="">Garibaldi</option>
						</select>
					</li>
					<li>
						<label for="">Nome da linha / travessão</label>
						<select name="" id="">
							<option value="">Nova Sardenha</option>
						</select>
					</li>
				</ol>
			</fieldset>
			<div class="buttons">
				<button type="button" class="button">adicionar</button>
			</div>
		</form>
	</div>
	
	<form action="" id="search-landholder" class="panel open">
		<h3 class="header">Proprietários</h3>
		<div class="content">
			<fieldset>
				<ol>
					<li>
						<?php echo Form::label('Nome da família', 'name', array('for' => 'search-landholder-name')); ?>
						<?php echo Form::input('name', null, array('id' => 'search-landholder-name')); ?>
					</li>
				</ol>
			</fieldset>
			<div class="buttons">
				<button id="search-trail-button" class="button">pesquisar</button>
			</div>
			<script type="text/html" id="search-landholder-table-template">
				<li class="landholder" data-landholder_id="<%= data.id %>">
					<a href="#" class="label"><%= data.name %></a>
				</li>
			</script>
			<ul id="search-landholder-table"></ul>
		</div>
	</form>
	
	<footer class="footer">
		2013 - <a href="#">sobre o projeto</a>
	</footer>
	
</div>


<script type="text/html" id="map-plot-window-template">
	<ul class="nav">
		<li><a href="#plot-data" class="active">Lote</a></li>
		<li><a href="#plot-landholder">Proprietário</a></li>
	</ul>

	<div id="plot-data" class="content">
		<h1 class="title">Dados Históricos</h1>
		<ul>
			<li><span class="label">Número:</span> <%= data.number %></li>
			<li><span class="label">Colônia:</span> <%= data.colony && data.colony.name || '-' %></li>
			<li><span class="label">Linha:</span> <%= data.trail && data.trail.name || '-' %></li>
			<li><span class="label">Núcleo:</span> <%= data.nucleu && data.nucleu.name || '-' %></li>
			<li><span class="label">Secção:</span> <%= data.section && data.section.name || '-' %></li>
			<li><span class="label">Lado/Ala:</span> <%= data.edge && data.edge.name || '-' %></li>
		</ul>

		<h1 class="title">Dados de Geoprocessamento</h1>
		<ul>
			<li><span class="label">Área (real):</span> <%= data.area || '-' %> m2</li>
			<li><span class="label">Cidade atual (mais próxima):</span> <%= data.city && data.city.name || '-' %></li>
			<li><span class="label">Elevação média (aproximada):</span> <%= data.elevation %> m</li>
		</ul>
	</div>

	<div id="plot-landholder" class="content hide">
		<% 
			var len = data.plot_landholders && data.plot_landholders.length
			if (len) {
		%>
			<% _.each(data.plot_landholders, function(data, i) { %>
				<h1 class="title">Proprietário <%= len - i %></h1>
				<ul>
					<li><span class="label">Nome:</span> <%= data.landholder.name || '-' %></li>
					<li><span class="label">Família:</span> <%= data.landholder.family || '-' %></li>
					<li><span class="label">Ano de concessão do lote:</span> <%= data.granting || '-' %></li>
					<li><span class="label">Ano de quitação do lote:</span> <%= data.release || '-' %></li>
					<li><span class="label">Valor do lote:</span> $ <%= data.price || '-' %></li>
					<li><span class="label">Área (informada):</span> <%= data.area || '-' %> m2</li>
				</ul>
			<% 	}) %>
		<% } else { %>
			Não foram encontradas informações a respeito dos proprietários.
		<% } %>
	</div>
</script>
<div id="map"></div>