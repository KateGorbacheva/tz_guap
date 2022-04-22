<?php

require_once '/var/www/web_test.com/connection/con_bd.php';
require_once '/var/www/web_test.com/connection/con_list.php';

$sql = "SELECT id_ts_t,name_ts_t,st/ins_t as res, st,ins_t from i,t
	where id_ts_t=id_ts_i order by res desc";

$statement = $db->query($sql);

$mas = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($mas as $res){
   $items = array($res ['id_ts_t'],$res ['res'],$res ['st'], $res ['ins_t']);
   echo $twig->render('list.twig',array('items' => $items));

}
    /*echo 'id: '.$row->id_ts_t;
    echo 'кол-во ст/кол-во пров: '.$row->res;
    echo '<br>';
    echo 'Кол-во студентов: '.$row->st;
    echo '<br>';
    echo 'Кол-во проверяющих: '.$row->ins_t; */


//close connection bd
$statement = null;
$db = null;
?>
