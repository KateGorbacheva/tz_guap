<?php

require_once '/var/www/web_test.com/con_bd.php';
require_once '/var/www/web_test.com/con_table.php';

$stud_id = $_POST['stud_id'];


$statement = $db->query("select name_task,lastname_stud,name_stud,otchestvo_stud  from rel_task_stud join student on student.id_student=rel_task_stud.id_stud join task on task.id_task=rel_task_stud.id_task  WHERE id_student = '$stud_id'");

$labels = array (
'Название',
'Фамилия',
'Имя',
'Отчество'
);


$row = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($row as $res){

	$items[] = array(
  'first'     => $res ['name_task'],
  'second'     => $res ['lastname_stud'],
  'third'     => $res ['name_stud'],
  'fourth'     => $res ['otchestvo_stud']
);
}

$count = $statement->rowCount();

if ($count != 0){
echo   $template->render(array('items' => $items,'labels' => $labels));
}else {

 echo "Записей не обнаруженно";
 }


?>
