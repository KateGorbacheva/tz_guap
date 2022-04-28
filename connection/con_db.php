<?php
require_once '/var/www/web_test.com/vendor/autoload.php';
use Dotenv\Dotenv;
$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();
try {
  $db = new PDO('mysql:host='.$_ENV['DB_HOST'].';dbname='.$_ENV['DB_NAME'].'', $_ENV['DB_USER'], $_ENV['DB_PASSWORD']);
} catch (PDOException $e) {
  print "Error: " . $e->getMessage();
  die();
}
?>
