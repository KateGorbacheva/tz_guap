<?php
require_once '/var/www/web_test.com/vendor/autoload.php';
Twig_Autoloader::register();
try {
  	$loader = new Twig_Loader_Filesystem('/var/www/web_test.com/templates');

  	$twig = new Twig_Environment($loader);


	} catch (Exception $e) {
  	die ('ERROR: ' . $e->getMessage());
	}
?>
