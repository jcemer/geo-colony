<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><?php echo $title; ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
	<?php echo Asset::css('main.css'); ?>
</head>
<body>
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
		
		<div id="search-colonies" class="panel">
			<h3 class="header">Colônias</h3>
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
	
	
	
<?php echo $content; ?>
	
<?php if (Session::get_flash('success')): ?>
				<div class="alert-message success">
					<p>
					<?php echo implode('</p><p>', e((array) Session::get_flash('success'))); ?>
					</p>
				</div>
<?php endif; ?>

<?php if (Session::get_flash('error')): ?>
				<div class="alert-message error">
					<p>
					<?php echo implode('</p><p>', e((array) Session::get_flash('error'))); ?>
					</p>
				</div>
<?php endif; ?>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<?php echo Asset::js('main.js'); ?>
</body>
</html>
