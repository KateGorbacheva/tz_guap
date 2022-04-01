<?php
try {
  $db = new PDO('mysql:host=localhost;dbname=test_bd', 'admin', '1234');
} catch (PDOException $e) {
  print "Error!: " . $e->getMessage();
  die();
}
?>
