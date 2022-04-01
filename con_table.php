<?php
require_once '/home/test_user/vendor/autoload.php';
Twig_Autoloader::register();
try {
  	$loader = new Twig_Loader_Filesystem('templates');

  	$twig = new Twig_Environment($loader);

  	$template = $twig->loadTemplate('table.tmpl');



	} catch (Exception $e) {
  	die ('ERROR: ' . $e->getMessage());
	}
?>
