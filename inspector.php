<?php
require_once '/var/www/web_test.com/con_bd.php';
require_once '/var/www/web_test.com/con_table.php';

$inspector_id = $_POST['inspector_id'];

$statement = $db->query("select lastname_stud,name_stud,otchestvo_stud,class.id_class from rel_stud_class JOIN student ON student.id_student=rel_stud_class.id_student JOIN class ON class.id_class=rel_stud_class.id_class WHERE class.id_task=(select task.id_task from rel_ins_task join inspector ON inspector.id_inspector=rel_ins_task.id_inspector JOIN task ON task.id_task=rel_ins_task.id_task WHERE inspector.id_inspector='$inspector_id' AND rel_ins_task.id_task='1')");


//select COUNT(student.id_student) as kol_vo from rel_stud_class JOIN student ON student.id_student=rel_stud_class.id_student JOIN class ON class.id_class=rel_stud_class.id_class WHERE class.id_task=(select task.id_task from rel_ins_task join inspector ON inspector.id_inspector=rel_ins_task.id_inspector JOIN task ON task.id_task=rel_ins_task.id_task WHERE inspector.id_inspector='1' AND rel_ins_task.id_task='1')

$labels = array (
'Группа',
'Фамилия',
'Имя',
'Отчество'

);

$row = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($row as $res){

	$items[] = array(
  'first'     => $res ['id_class'],
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
