<?php
	//подключаем бд  и autoload.php

	require_once 'connection/con_bd.php';

	Twig_Autoloader::register();
	try {

  	$loader = new Twig_Loader_Filesystem('templates');

  	$twig = new Twig_Environment($loader);

  	$template = $twig->loadTemplate('index.twig');



	} catch (Exception $e) {
  	die ('ERROR: ' . $e->getMessage());
	}

	$statement1 = $db->query("SELECT * FROM student ");
	$statement2 = $db->query("SELECT * FROM task ");
	$statement3 = $db->query("SELECT * FROM lesson ");
	$statement4 = $db->query("SELECT * FROM inspector");

	//1 task

	$mas = $statement1->FetchALL(PDO::FETCH_ASSOC);
	foreach($mas as $row){
	 $students[] = array($row['id_student'],$row['lastname_stud'],$row['name_stud'],$row['otchestvo_stud']);
	 }

	//2 task

	$mas = $statement2->FetchALL(PDO::FETCH_ASSOC);
	foreach($mas as $row){
	 $tasks[] = array($row['id_task'],$row['name_task']);
	 }

	//3 task

	$mas = $statement3->FetchALL(PDO::FETCH_ASSOC);
	foreach($mas as $row){
	 $lessons[] = array($row['id_lesson'],$row['subject']);
	 }

	 //4 task

	$mas = $statement4->FetchALL(PDO::FETCH_ASSOC);
	foreach($mas as $row){
	 $inspectors[] = array($row['id_inspector'],$row['lastname_ins'],$row['name_ins'],$row['otchestvo_ins']);
	 }


	echo $template->render(array (
		'students' => $students,
   	 	'tasks' => $tasks,
   	 	'lessons' => $lessons,
   	 	'inspectors' => $inspectors
   	 	));



	//close connection bd

	$statement1 = null;
	$statement2 = null;
	$statement3 = null;
	$statement4 = null;

	$db = null;

?>
