$(document).ready(function() {
btn_stud.onclick=stud;
btn_task.onclick=task;
btn_lesson.onclick=lesson;
btn_inspector.onclick=inspector;
btn_ins.onclick=ins;
btn_si.onclick=s_i;
  });
  //обработчик статуса
function err(jqXHR, exception){
      		if (jqXHR.status === 0) {
			alert('Not connect. Verify Network.');
		} else if (jqXHR.status == 404) {
			alert('Requested page not found ' +jqXHR.status);
		} else if (jqXHR.status == 500) {
			alert('Internal Server Error ' +jqXHR.status);
		} else {
			alert('Unidentified error');
		}

      };
//функция поиска по нажатию кнопки
function stud(){
  let stud_id = $("#stud_id").val();

  $.ajax({
    url: '/php/stud.php',
    type: 'POST',
    data: {'stud_id': stud_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_stud").prop("disable",true);

    },

    success: function(data){
      $('#info').html('<div>' +data+ '</div>');

      },
    error: function (jqXHR, exception){
      		err(jqXHR, exception);
      },


  });

  };

  function task(){
  let task_id = $("#task_id").val();

  $.ajax({
    url: '/php/task.php',
    type: 'POST',
    data: {'task_id': task_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_task").prop("disable",true);

    },

    success: function(data){
      $('#info1').html('<div>' +data+ '</div>');

      },
    error: function (jqXHR, exception){
      		err(jqXHR, exception);
      },


  });

  };

  function lesson(){
  let lesson_id = $("#lesson_id").val();

  $.ajax({
    url: '/php/lesson.php',
    type: 'POST',
    data: {'lesson_id': lesson_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_lesson").prop("disable",true);

    },

    success: function(data){
      $('#info2').html('<div>' +data+ '</div>');

      },
    error: function (jqXHR, exception){
      		err(jqXHR, exception);
      },


  });

  };


   function inspector(){
   let inspector_id = $("#inspector_id").val();

   $.ajax({
    url: '/php/inspector.php',
    type: 'POST',
    data: {'inspector_id': inspector_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_inspector").prop("disable",true);

    },

    success: function(data){
      $('#info3').html('<div>' +data+ '</div>');

      },
    error: function (jqXHR, exception){
      		err(jqXHR, exception);
      },


  });

  };



   function ins(){

   $.ajax({
    url: '/php/ins.php',
    type: 'POST',
    dataType: 'text',
    beforeSend: function(){
      $("#btn_ins").prop("disable",true);

    },

    success: function(data){
      $('#info4').html('<div>' +data+ '</div>');

      },
    error: function (jqXHR, exception){
      		err(jqXHR, exception);
      },


  });

  };

  function s_i(){

   $.ajax({
    url: '/php/si.php',
    type: 'POST',
    dataType: 'text',
    beforeSend: function(){
      $("#btn_si").prop("disable",true);

    },

    success: function(data){
      $('#info5').html('<div>' +data+ '</div>');

      },
    error: function (jqXHR, exception){
      		err(jqXHR, exception);
      },


  });

  };
