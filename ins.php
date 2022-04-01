<?php

require_once '/var/www/web_test.com/con_bd.php';
require_once '/var/www/web_test.com/con_list.php';

$statement = $db->query("select lastname_ins,name_ins,otchestvo_ins,COUNT(rel_ins_task.id_task) as kol from rel_ins_task JOIN inspector ON inspector.id_inspector=rel_ins_task.id_inspector JOIN task ON task.id_task=rel_ins_task.id_task GROUP by inspector.id_inspector order by kol DESC");



while ($row = $statement->fetch(PDO::FETCH_LAZY)) {
//'Кол-во заданий: '.$row->kol;

 $items = array($row->lastname_ins,$row->name_ins,$row->otchestvo_ins,$row->kol);

	echo $template->render(array (
   	 'items' => $items
  	));

}


?>
