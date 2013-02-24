<div id="sidebar">
	<header>
		<h1 class="logo">Geo Colony</h1>
		<h2 class="title">Mapa das colônias <b>italianas</b> e <b>alemãs</b> no <b>Rio Grande do Sul</b></h2>
	</header>
	
	<div id="trails">
		<script type="text/html" id="trails-list-template">
			<li class="trail" data-trail_id="<%= id %>" style="background-color: <%= color %>">
				<span class="label"><%= name %></span>
				<a href="#" class="remove-link" title="remover">remover</a>
			</li>
		</script>
		<ul class="trails-list"></ul>
		<div class="buttons">
			<button type="button" class="reset-trails-button button">limpar</button>
		</div>
	</div>
	
	<div id="search-trail" class="panel open">
		<h3 class="header">Colônias</h3>
		<form action="" class="content">
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
				<button type="button" id="search-trail-button" class="button" disabled>adicionar</button>
			</div>
		</form>
	</div>
	
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
	
	<div id="search-landholder" class="panel">
		<h3 class="header">Proprietários</h3>
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
	
	<footer class="footer">
		2013 - <a href="#">sobre o projeto</a>
	</footer>
	
</div>

<div id="map"></div>