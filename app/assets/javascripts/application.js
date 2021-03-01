// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery 
//= require jquery_ujs

document.addEventListener("turbolinks:load", function(){
  $('.delete_answer').click(function(){
    var words = this.id.split("_")
    const deleteAnswerId = "#answer_" + words[2] + "_" + words[3];
    $(deleteAnswerId).remove();
  });

  $('.add_answer').click(function() {
    var words = this.id.split("_")
    const answerId = "#answer_" + words[2];
    const index = words[2] + '_' + $(answerId).find('.row').length;
    const newAnswer = '<div id="answer_' + index + '" class="row"><div class="col-2"><select name="judgment_' + index + '" id="judgment_' + index + '" class="form-control border-info"><option selected="selected" value="true">○</option><option value="false">×</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '" id="answer_content_' + index + '" class="form-control border-info" rows="1" placeholder="選択肢を作成してください。"></textarea></div></div><br>';
    $(answerId).append(newAnswer);
  })
});