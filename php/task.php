<?php
require_once '/var/www/web_test.com/connection/con_bd.php';
require_once '/var/www/web_test.com/connection/con_templates.php';

$task_id = $_POST['task_id'];

$task_id = intval($task_id);

$sql = "select lastname_stud,name_stud,otchestvo_stud,class.id_class from rel_stud_class
	JOIN student ON student.id_student=rel_stud_class.id_student
	JOIN class ON class.id_class=rel_stud_class.id_class
	WHERE class.id_task=:task_id";

$statement = $db->prepare($sql);

$statement->bindParam('task_id', $task_id);
$statement->execute();


$labels = array (
'Фамилия',
'Имя',
'Отчество',
'Группа'

);

$mas = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($mas as $res){
   $items[] = array($res ['lastname_stud'],$res ['name_stud'], $res ['otchestvo_stud'],$res ['id_class']);
}



$count = $statement->rowCount();

	if ($count > 0){
		echo $twig->render('table.twig',array('items' => $items,'labels' => $labels));

		}elseif ($count < 0) {
 		 echo "Ошибка!";
 			}else{
 				echo "Записей не обнаруженно";
 			}
//close connection bd
$statement = null;
$db = null;

?>
