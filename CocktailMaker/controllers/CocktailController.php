<?php

class CocktailController{
	public function console_log( $data ){
	  echo '<script>';
	  echo 'console.log('. json_encode( $data ) .')';
	  echo '</script>';
	}
	
	public function __controller(){
		
	}
	
	public function run(){
		if(isset($_GET['code'])){
			$output= shell_exec('/home/pi/scriptsCocktail/cocktail.py service '.$_GET['code'] .' ');
		}	
		require_once(CHEMIN_VUES."cocktail.php");

	}
	
}
?>
