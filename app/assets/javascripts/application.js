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

document.addEventListener("turbolinks:load", function() {
  $('body').on("click", ".delete_answer", function() {  // 選択肢の削除ボタンをクリックした時
    var words = this.id.split("_");
    const deleteAnswerId = "#answer_" + words[2] + "_" + words[3];  // 削除対象の選択肢
    $(deleteAnswerId).remove();
    $('.answers').each(function() {
      var a_words = this.id.split("_");
      const answers = $(this).find('.answer');  // 選択肢を取得
      const judgments = $(answers).find('.judgment');  // 判定を取得
      const contents = $(answers).find('.content');  // 選択肢の内容を取得
      const deleteAnswers = $(answers).find('.delete_answer')  // 選択肢の削除ボタンを取得
      $(answers).each(function(i) {
        $(this).attr('id', a_words[0] + "_" + a_words[1] + "_" + (i));  // 選択肢の順番を表す番号の振り直し
      })
      $(judgments).each(function(i) {
        var j_words = this.id.split("_");
        $(this).attr('name', j_words[0] + "_" + a_words[1] + "_" + (i));  // 判定の順番を表す番号の振り直し
        $(this).attr('id', j_words[0] + "_" + a_words[1] + "_" + (i));
      })
      $(contents).each(function(i) {
        var c_words = this.id.split("_");
        $(this).attr('name', c_words[0] + "_" + c_words[1] + "_" + a_words[1] + "_" + (i));  // 選択肢の内容の順番を表す番号の振り直し
        $(this).attr('id', c_words[0] + "_" + c_words[1] + "_" + a_words[1] + "_" + (i));
      })
      $(deleteAnswers).each(function(i) {
        $(this).attr('id', words[0] + "_" + words[1] + "_" + a_words[1] + "_" + (i + 2));  // 選択肢の削除ボタンの順番を表す番号の振り直し
      })
    })
  });

  $('body').on("click", ".add_answer", function() {  // 選択肢の追加ボタンをクリックした時
    var maxCount = 5;
    var words = this.id.split("_");
    const answerId = "#answer_" + words[2];
    const index = words[2] + '_' + $(answerId).find('.row').length;  // 追加する選択肢の順番を表す番号
    const newAnswer = '<div id="answer_' + index + '" class="answer"><div class="row"><div class="col-2"><select name="judgment_' + index + '" id="judgment_' + index + '" class="form-control border-success judgment"><option selected="selected" value="false">×</option><option value="true">○</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '" id="answer_content_' + index + '" class="form-control border-success content" rows="1" placeholder="選択肢を作成してください。" required="required"></textarea></div><div class="col-2"><a id="delete_answer_' + index + '" class="btn btn-danger delete_answer far fa-trash-alt fa-lg text-white"></a></div></div><br></div>';
    if ($(answerId).find('.row').length < maxCount) {
      $(answerId).append(newAnswer);
    } else if ($(answerId).find('.row').length == maxCount) {
      alert('選択肢は５つまでです。');
    }
  });

  $('body').on("click", ".delete_question", function() {  // 問題の削除ボタンをクリックした時
    var words = this.id.split("_");
    const deleteQuestionId = "#question_" + words[2];
    if (words[2] == 0) {
      alert('削除できません。');  // 問題が１問もないときに表示させる
    } else if (words[2] > 0) {
      if (!confirm('削除してもよろしいですか？')) {
        return false;
      } else {
        $(deleteQuestionId).remove();
        $('.question').each(function(i) {
          $(this).attr('id','question_' + (i));  // 問題の順番を表す番号の振り直し
        })
        $('.delete_question').each(function(i) {
          $(this).attr('id','delete_question_' + (i));  // 問題の削除ボタンの順番を表す番号の振り直し
        })
        $('.q_content').each(function(i) {
          $(this).attr('name','question_content_' + (i));  // 問題文の順番を表す番号の振り直し
          $(this).attr('id','question_content_' + (i));
        })
        $('.answers').each(function(i) {
          $(this).attr('id','answer_' + (i));
          var a_words = this.id.split("_");
          const answers = $(this).find('.answer');
          const judgments = $(answers).find('.judgment');
          const contents = $(answers).find('.content');
          const deleteAnswers = $(answers).find('.delete_answer');
          $(answers).each(function() {
            var answerWords = this.id.split("_");
            $(this).attr('id', a_words[0] + "_" + a_words[1] + "_" + answerWords[2]);
          })
          $(judgments).each(function() {
            var j_words = this.id.split("_");
            $(this).attr('name', j_words[0] + "_" + a_words[1] + "_" + j_words[2]);
            $(this).attr('id', j_words[0] + "_" + a_words[1] + "_" + j_words[2]);
          })
          $(contents).each(function() {
            var c_words = this.id.split("_");
            $(this).attr('name', c_words[0] + "_" + c_words[1] + "_" + a_words[1] + "_" + c_words[3]);
            $(this).attr('id', c_words[0] + "_" + c_words[1] + "_" + a_words[1] + "_" + c_words[3]);
          })
          $(deleteAnswers).each(function() {
            var d_words = this.id.split("_");
            $(this).attr('id', d_words[0] + "_" + d_words[1] + "_" + a_words[1] + "_" + d_words[3]);
          })
        })
        $('.add_answer').each(function(i) {
          $(this).attr('id','add_answer_' + (i));
        })
        $('.commentary').each(function(i) {
          $(this).attr('name','commentary_' + (i));
          $(this).attr('id','commentary_' + (i));
        })
      }
    } 
  });

  $('body').on("click", ".add_question", function() {  // 問題の追加ボタンをクリックした時
    var maxCount = 100;
    const index = $('#quiz_container').find('.card-body').length;  // 追加する問題の順番を表す番号
    const newQuestion = '<div id="question_' + index + '" class="question"><div class="row"><div class="col-12"><div class="card border-success"><div class="card-body"><div class="row"><div class="col-3"><h3 class="text-success">問題文</h3></div><div class="col-9"><a id="delete_question_' + index + '" class="btn btn-danger float-right text-white delete_question">問題の削除</a></div></div><div class="row"><div class="col"><textarea name="question_content_' + index + '" id="question_content_' + index + '" class="form-control border-success q_content" rows="3" placeholder="問題文を作成してください。" required="required"></textarea></div></div><br><div class="row"><div class="col"><h3 class="text-success">選択肢</h3></div></div><div id="answer_' + index + '" class="answers"><div id="answer_' + index + '_0" class="answer"><div class="row"><div class="col-2"><select name="judgment_' + index + '_0" id="judgment_' + index + '_0" class="form-control border-success judgment"><option value="false">×</option><option value="true">○</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '_0" id="answer_content_' + index + '_0" class="form-control border-success content" rows="1" placeholder="選択肢を作成してください。" required="required"></textarea></div></div><br></div><div id="answer_' + index + '_1" class="answer"><div class="row"><div class="col-2"><select name="judgment_' + index + '_1" id="judgment_' + index + '_1" class="form-control border-success judgment"><option value="false">×</option><option value="true">○</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '_1" id="answer_content_' + index + '_1" class="form-control border-success content" rows="1" placeholder="選択肢を作成してください。" required="required"></textarea></div></div><br></div><div id="answer_' + index + '_2" class="answer"><div class="row"><div class="col-2"><select name="judgment_' + index + '_2" id="judgment_' + index + '_2" class="form-control border-success judgment"><option value="false">×</option><option value="true">○</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '_2" id="answer_content_' + index + '_2" class="form-control border-success content" rows="1" placeholder="選択肢を作成してください。" required="required"></textarea></div><div class="col-2"><a id="delete_answer_' + index + '_2" class="btn btn-danger delete_answer far fa-trash-alt fa-lg text-white"></a></div></div><br></div><div id="answer_' + index + '_3" class="answer"><div class="row"><div class="col-2"><select name="judgment_' + index + '_3" id="judgment_' + index + '_3" class="form-control border-success judgment"><option value="false">×</option><option value="true">○</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '_3" id="answer_content_' + index + '_3" class="form-control border-success content" rows="1" placeholder="選択肢を作成してください。" required="required"></textarea></div><div class="col-2"><a id="delete_answer_' + index + '_3" class="btn btn-danger delete_answer far fa-trash-alt fa-lg text-white"></a></div></div><br></div><div id="answer_' + index + '_4" class="answer"><div class="row"><div class="col-2"><select name="judgment_' + index + '_4" id="judgment_' + index + '_4" class="form-control border-success judgment"><option value="false">×</option><option value="true">○</option></select></div><div class="col-8"><textarea name="answer_content_' + index + '_4" id="answer_content_' + index + '_4" class="form-control border-success content" rows="1" placeholder="選択肢を作成してください。" required="required"></textarea></div><div class="col-2"><a id="delete_answer_' + index + '_4" class="btn btn-danger delete_answer far fa-trash-alt fa-lg text-white"></a></div></div><br></div></div><div class="row"><div class="col-11"><a id="add_answer_' + index + '" class="btn btn-success float-right text-white add_answer">選択肢の追加</a></div></div><div class="row"><div class="col-3"><h3 class="text-success">解説</h3></div></div><div class="row"><div class="col"><textarea name="commentary_' + index + '" id="commentary_' + index + '" class="form-control border-success commentary" rows="3" placeholder="解説文を作成してください。" required="required"></textarea></div></div><br></div></div></div></div><br></div>';
    if (index < maxCount) {
      $('#quiz_container').append(newQuestion);
    } else if (index == maxCount) {
      alert('問題はこれ以上作成できません。');
    }
  });

  $('body').on("change", ".judgment", function() {  // 判定を変更した時
    if (this.value == 'false') {  // 判定を✖️にした時
      return;
    }
    var i = 0;
    var words = this.id.split("_");
    const changed_index = parseInt(words[2]);
    while (true) {
      var elem = $('#' + words[0] + '_' + words[1] + '_' + i);
      if (elem.length == 0) {
        break;
      }
      if (i != changed_index) {
        elem.val('false');
      }
      i++;
    }
  });

  $('body').on("click", ".save", function() {  // 保存するボタンをクリックした時
    $('body').off('submit', 'form');
    $('.answers').each(function(i) {
      const answers = $(this).find('.answer');
      const judgments = $(answers).find('.judgment');
      const judgment = $(judgments).find($('.judgment option:selected')).map(function() {
                         return $(this).val();
                       }).get();  // 各選択肢で選択している判定を取得
      var count = $.inArray("true", judgment);  // ○が含まれているかどうか確認
      $('body').on("submit", "form", function() { 
        if (count == - 1) {  // ○がない時
          alert((i + 1) + '番目の問題に正解の選択肢がありません。');
          return false;
        } else if (count > - 1) {  // ○がある時
          return true;
        }
      });
      if (count == - 1) {
        return false;
      }
    })
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function(e) {
        $('#icon_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_icon").change(function() {
    readURL(this);
  });
});