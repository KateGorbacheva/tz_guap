<!DOCTYPE html>
<html lang="ru">
<head>

	<meta charset="UTF-8">


      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <!-- Подключаем jQuery и Bootstrap JS через CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="clc_btn.js"></script>

<style type="text/css">

.custom-select{
 width:300px;

}
mark {
background-color:lightblue ;
font-size:13pt;
}


</style>

</head>

<body>
	<br>

	<?php
	require_once '/var/www/web_test.com/con_bd.php';

	$statement1 = $db->query("SELECT * FROM student ");
	$statement2 = $db->query("SELECT * FROM task ");
	$statement3 = $db->query("SELECT * FROM lesson ");
	$statement4 = $db->query("SELECT * FROM inspector");


	?>
	<div "class="container">
	<p><mark>Выборка всех заданий студента</mark></p>

	<select class="custom-select" name="stud_id" id="stud_id" >
	<?php while ($row = $statement1->fetch(PDO::FETCH_LAZY)): ?>
	<option value="<?=$row['id_student']?>"><?=$row['lastname_stud']?> <?=$row['name_stud']?> <?=$row['otchestvo_stud']?></option>
	<?php endwhile?>
	</select>
	<br><br>

	<button type="submit" id = "btn_stud" name = "btn_stud" class="btn btn-success">Искать</button>

	<br>
	<div id = "info"></div>
	<br>

	<p><mark>Выборка для задания списка групп и студентов</mark></p>
	<select class="custom-select " name="task_id" id="task_id" >
	<?php while ($row = $statement2->fetch(PDO::FETCH_LAZY)): ?>
	<option value="<?=$row['id_task']?>"><?=$row['name_task']?></option>
	<?php endwhile?>
	</select>
	<br><br>

	<button type="submit" id = "btn_task" name = "btn_task" class="btn btn-success">Искать</button>

	<br>
	<div id = "info1"></div>
	<br>
	
	<p><mark>Вывод списка студентов для конкретного занятия</mark></p>
	<select class="custom-select" name="lesson_id" id="lesson_id" >
	<?php while ($row = $statement3->fetch(PDO::FETCH_LAZY)): ?>
	<option value="<?=$row['id_lesson']?>"><?=$row['subject']?></option>
	<?php endwhile?>
	</select>
	<br><br>

	<button type="submit" id = "btn_lesson" name = "btn_lesson" class="btn btn-success">Искать</button>

	<br>
	<div id = "info2"></div>
	<br>

	<p><mark>Выборка для проверяющего количества студентов для 1го задания с учётом привязки
	групп со студентами</mark></p>
	<select class="custom-select" name="inspector_id" id="inspector_id" >
	<?php while ($row = $statement4->fetch(PDO::FETCH_LAZY)): ?>
	<option value="<?=$row['id_inspector']?>"><?=$row['lastname_ins']?> <?=$row['name_ins']?> <?=$row['otchestvo_ins']?></option>
	<?php endwhile?>
	</select>
	<br><br>

	<button type="submit" id = "btn_inspector" name = "btn_inspector" class="btn btn-success">Искать</button>

	<br>
	<div id = "info3"></div>
	<br>


	<p><mark>Расчёт нагрузки проверяющих: какое количество заданий необходимо проверить, в том числе совместные. Представить в убывающем порядке.</mark></p>

	<button type="submit" id = "btn_ins" name = "btn_ins" class="btn btn-success">Вывод/Обновить</button>

	<br>
	<div id = "info4"></div>
	<br>

	<p><mark>Расчёт статистики "критически нагруженных" заданий: сколько студентов выполняет задание "делимое на" количество проверяющих это задание. Представить в убывающем порядке.</mark></p>

	<button type="submit" id = "btn_si" name = "btn_si" class="btn btn-success">Вывод/Обновить</button>

	<br>
	<div id = "info5"></div>
	<br>



	</div>

</body>
</html>
