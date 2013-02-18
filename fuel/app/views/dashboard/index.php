<div id="sidebar">
	<header>
		<h1 class="logo">Geo Colony</h1>
		<h2 class="title">Mapa das colônias <b>italianas</b> e <b>alemãs</b> no <b>Rio Grande do Sul</b></h2>
	</header>
	
	<div id="trails">
		<script type="text/html" id="trails-list-template">
			<li style="background-color: <%= color %>">
				<span class="label"><%= name %></span>
				<a href="#" class="remove-link" title="remover">remover</a>
			</li>
		</script>
		<ul class="trails-list">
			<li style="background-color: #A9F16C">
				<span class="label">Alencar Araripe</span>
				<a href="#" class="remove-link" title="remover">remover</a>
			</li>
			<li style="background-color: #FF7373">
				<span class="label">Alencar Araripe Alencar Araripe</span>
				<a href="#" class="remove-link" title="remover">remover</a>
			</li>
			<li style="background-color: #61D7A4">
				<span class="label">Barão de Cotegipe</span>
				<a href="#" class="remove-link" title="remover">remover</a>
			</li>
		</ul>
		<div class="buttons">
			<a href="#" class="trails-clean-button button">limpar</a>
		</div>
	</div>
	
	<div id="trails-search" class="panel open">
		<h3 class="header">Colônias</h3>
		<form action="" class="content">
			<fieldset>
				<ol>
					<li>
						<?php echo Form::label('Nome da colônia', 'colony', array('for' => 'trails-search-colony')); ?>
						<?php echo Form::select('colony', null, $colonies, array('id' => 'trails-search-colony')); ?>
					</li>
					<li>
						<?php echo Form::label('Nome da linha / travessão', 'trail', array('for' => 'trails-search-trail')); ?>
						<?php echo Form::select('trail', null, $trails, array('id' => 'trails-search-trail', 'disabled' => true)); ?>
					</li>
				</ol>
			</fieldset>
			<div class="buttons">
				<button type="button" id="trails-search-button" class="button" disabled>adicionar</button>
			</div>
		</form>
	</div>
	
	<div id="locations-search" class="panel">
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
	
	<div id="landholders-search" class="panel">
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