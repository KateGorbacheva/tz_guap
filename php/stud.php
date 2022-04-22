<?php

require_once '/var/www/web_test.com//connection/con_bd.php';
require_once '/var/www/web_test.com/connection/con_table.php';



$stud_id = $_POST['stud_id'];

$sql ="select name_task,lastname_stud,name_stud,otchestvo_stud  from rel_task_stud
	join student on student.id_student=rel_task_stud.id_stud
	join task on task.id_task=rel_task_stud.id_task
	WHERE id_student = '$stud_id'";

$statement = $db->query($sql);

$labels = array ('Название','Фамилия','Имя','Отчество');


$mas = $statement->FetchALL(PDO::FETCH_ASSOC);

foreach ($mas as $res){
   $items[] = array($res ['name_task'],$res ['lastname_stud'], $res ['name_stud'],$res ['otchestvo_stud']);
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
