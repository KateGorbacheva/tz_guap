<?php

require_once '/var/www/web_test.com/connection/con_bd.php';
require_once '/var/www/web_test.com/connection/con_list.php';

$sql = "select lastname_ins,name_ins,otchestvo_ins,COUNT(rel_ins_task.id_task) as kol from rel_ins_task
	JOIN inspector ON inspector.id_inspector=rel_ins_task.id_inspector
	JOIN task ON task.id_task=rel_ins_task.id_task
	GROUP by inspector.id_inspector
	order by kol DESC";

$statement = $db->query($sql);

$mas = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($mas as $res){
   $items = array($res ['lastname_ins'],$res ['name_ins'], $res ['otchestvo_ins'],$res ['kol']);
   echo $twig->render('list.twig',array('items' => $items));

}

//close connection bd
$statement = null;
$db = null;
?>
