<div id="sidebar">
	<header>
		<h1 class="logo">Geo Colony</h1>
		<h2 class="title">Mapa das colônias <b>italianas</b> e <b>alemãs</b> no <b>Rio Grande do Sul</b></h2>
	</header>
	
	<div id="colonies">
		<ul class="colonies-list">
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
			<a href="#" class="colonies-clean-button button">limpar</a>
		</div>
	</div>
	
	<div id="search-colonies" class="panel open">
		<h3 class="header">Colônias</h3>
		<form action="" class="content">
			<fieldset>
				<ol>
					<li>
						<?php echo Form::label('Nome da colônia', 'colony_id', array('for' => 'search-colonies-colony_id')); ?>
						<?php echo Form::select('colony_id', null, $colonies, array('id' => 'search-colonies-colony_id')); ?>
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
	
	<div id="search-locations" class="panel">
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
	
	<div id="search-landholders" class="panel">
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