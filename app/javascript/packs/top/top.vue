<template>  
  <div>
    <div class="container">
      <h5 class="text-center bg-warning">テストユーザー情報➡︎（ニックネーム）kazu（メールアドレス）ttttt@ttttt（パスワード）xyzxyz</h5>
      <div class="row">
        <div class="col-3">
          <i class="far fa-circle fa-10x"></i>
        </div> 
        <div class="col-6">  
          <catch-copy word="クイズを"></catch-copy><br>
          <catch-copy word="作って解いて"></catch-copy><br>
          <catch-copy word="楽しもう！"></catch-copy><br>
        </div>
        <div class="col-3">
          <i class="fas fa-times fa-10x"></i>
        </div>
      </div>
    </div><br><br>
    <div class="container">
      <introduction sentence="このアプリでは、クイズを作成したり、みんなが作成したクイズを解いたりして楽しめます。"></introduction><br>
      <introduction sentence="自分が作成したクイズを掲示板で宣伝し、みんなにチャレンジしてもらいましょう。"></introduction><br>
    </div><br>
    <div class="container">
      <div class="row">
        <div class="col-7">
          <h2 class="text-success float-right">まずは会員登録をしよう！➡︎</h2>
        </div>        
        <div class="col-5">
          <a class="btn btn-info btn-lg" href="/users/sign_up">会員登録</a>
        </div>  
      </div>
    </div><br><br>
  </div>
</template>


<script>
  var ComponentA = {
    props: ['word'],
    template: '<h1 class="text-center text-warning">{{ word }}</h1>'
  }

  var ComponentB = {
    props: ['sentence'],
    template: '<p class="text-center text-success">{{ sentence }}</p>'
  }

  export default {
    components: {
      'catch-copy': ComponentA,
      'introduction': ComponentB
    }
  }
</script>