$(document).ready(function() {
  var varCount = 1
  //remove a textfield    
  $('form').on('click', '.removeVar', function(){
     $(this).parent().remove();
  });
  //add a new node
  $('.addVar').on('click', function(){
    varCount++;
    $node = '<p><label for="choice_input'+varCount+'">Choice: </label><input type="text" name="choice_input['+varCount+']" id="choice_input'+varCount+'"><span class="removeVar">Remove Choice</span></p>';
    $(this).parent().before($node);
  });
  //add a new question
  $('#addQ').on('click', function(){
    $q = '<div class="edit_survey_question"><label for="question_input">Question:</label><input type="text" name="question" id="question_input"><br><br><p><label for="choice_input1">Choice: </label><input type="text" name="choice_input[1]" id="choice_input1"></p><p><span class="addVar">Add Choice</span></p></div>';
    $(this).parent().before($q);
  });

  //remove a question
  $('.deleteQ').on('click', function() {
    if (confirm('This will remove your question immediately. Are you sure?')) {
      $(this).parent().remove();
      var data = {id: $(this).next('span').text()}
      $.post('/delete_question', data)
    } else {
      
    }

  });
});
