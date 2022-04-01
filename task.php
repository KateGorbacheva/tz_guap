<?php
require_once '/var/www/web_test.com/con_bd.php';
require_once '/var/www/web_test.com/con_table.php';

$task_id = $_POST['task_id'];

$statement = $db->query("select lastname_stud,name_stud,otchestvo_stud,class.id_class from rel_stud_class JOIN student ON student.id_student=rel_stud_class.id_student JOIN class ON class.id_class=rel_stud_class.id_class WHERE class.id_task='$task_id'");

$labels = array (
'Фамилия',
'Имя',
'Отчество',
'Группа'

);

$row = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($row as $res){

	$items[] = array(
  'first'     => $res ['lastname_stud'],
  'second'     => $res ['name_stud'],
  'third'     => $res ['otchestvo_stud'],
  'fourth'     => $res ['id_class']
);
}
$count = $statement->rowCount();

if ($count != 0){
echo   $template->render(array('items' => $items,'labels' => $labels));
}else {

 echo "Записей не обнаруженно";
 }










?>
