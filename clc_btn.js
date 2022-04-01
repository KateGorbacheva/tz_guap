$(document).ready(function() {
btn_stud.onclick=stud;
btn_task.onclick=task;
btn_lesson.onclick=lesson;
btn_inspector.onclick=inspector;
btn_ins.onclick=ins;
btn_si.onclick=s_i;

//функция поиска по нажатию кнопки
function stud(){
  var stud_id = $("#stud_id").val();

  $.ajax({
    url: 'stud.php',
    type: 'POST',
    data: {'stud_id': stud_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_stud").prop("disable",true);

    },

    success: function(data){
      $('#info').html('<div>' +data+ '</div>');

      },


  });

  };

  function task(){
  var task_id = $("#task_id").val();

  $.ajax({
    url: 'task.php',
    type: 'POST',
    data: {'task_id': task_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_task").prop("disable",true);

    },

    success: function(data){
      $('#info1').html('<div>' +data+ '</div>');

      },


  });

  };

  function lesson(){
  var lesson_id = $("#lesson_id").val();

  $.ajax({
    url: 'lesson.php',
    type: 'POST',
    data: {'lesson_id': lesson_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_lesson").prop("disable",true);

    },

    success: function(data){
      $('#info2').html('<div>' +data+ '</div>');

      },


  });

  };


   function inspector(){
   var inspector_id = $("#inspector_id").val();

   $.ajax({
    url: 'inspector.php',
    type: 'POST',
    data: {'inspector_id': inspector_id},
    dataType: 'text',
    beforeSend: function(){
      $("#btn_inspector").prop("disable",true);

    },

    success: function(data){
      $('#info3').html('<div>' +data+ '</div>');

      },


  });

  };



   function ins(){

   $.ajax({
    url: 'ins.php',
    type: 'POST',
    dataType: 'text',
    beforeSend: function(){
      $("#btn_ins").prop("disable",true);

    },

    success: function(data){
      $('#info4').html('<div>' +data+ '</div>');

      },


  });

  };

  function s_i(){

   $.ajax({
    url: 'si.php',
    type: 'POST',
    dataType: 'text',
    beforeSend: function(){
      $("#btn_si").prop("disable",true);

    },

    success: function(data){
      $('#info5').html('<div>' +data+ '</div>');

      },


  });

  };



    });
