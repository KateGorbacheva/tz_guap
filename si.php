<?php

require_once '/var/www/web_test.com/con_bd.php';
require_once '/var/www/web_test.com/con_list.php';


$statement = $db->query("SELECT id_ts_t,name_ts_t,st/ins_t as res, st,ins_t from i,t where id_ts_t=id_ts_i order by res desc");

while ($row = $statement->fetch(PDO::FETCH_LAZY)) {
    /*echo 'id: '.$row->id_ts_t;
    echo 'кол-во ст/кол-во пров: '.$row->res;
    echo '<br>';
    echo 'Кол-во студентов: '.$row->st;
    echo '<br>';
    echo 'Кол-во проверяющих: '.$row->ins_t; */

 $items = array($row->name_ts_t,$row->res,$row->st,$row->ins_t);

	echo $template->render(array (
   	 'items' => $items
  	));

}


?>
