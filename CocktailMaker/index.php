<?php
	# Variables globales du site
	ob_start();
	define('CHEMIN_VUES','views/');
	# Tester si une variable GET 'action' est précisée dans l'URL index.php?action=...

	$action = (isset($_GET['action'])) ? htmlentities($_GET['action']) : 'default';
	# Quelle action est demandée ?
	switch($action) {		
		default: # Par défaut, le contrôleur de l'accueil est sélectionné
			require_once('controllers/CocktailController.php');	
			$controller = new CocktailController();
			break;
	}
	require_once(CHEMIN_VUES . 'header.php');
	# Exécution du contrôleur correspondant à l'action demandée
	#$cl=2;
	$controller->run();

	# Ecrire ici le footer du site de toutes pages HTML
	require_once(CHEMIN_VUES . 'footer.php');
	ob_end_flush();	
?>
