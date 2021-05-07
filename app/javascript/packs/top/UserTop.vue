<template>
  <div>
    <div class="container">
      <h2 class="text-success" v-if="user.nickname">ようこそ、{{ user.nickname }}さん！</h2>
    </div><br>
    <div class="container">
      <div class="row"> 
        <div class="col-12">
          <div class="card border-success">
            <h2 class="card-header bg-success text-white">クイズに挑戦しよう！</h2>
            <div class="card-body">
              <h4 class="card-text">みんなが作ったクイズにチャレンジしてみましょう。楽しかったクイズには”いいね！”をしましょう。</h4><br>
              <a href="/quizzes/search" class="btn btn-info btn-lg text-white float-right">クイズに挑戦！</a><br>
            </div>
          </div>
        </div>
      </div>
    </div><br><br>
    <div class="container">
      <div class="row">
        <div class="col-7 d-flex align-items-center">
          <h3 class="text-success">クイズを作成したい方はこちらへ！➡︎</h3>
        </div> 
        <div class="col-5">
          <a href="/my_quizzes" class="btn btn-info btn-lg text-white">クイズの作成</a>
        </div>
      </div><br><br>
      <div class="row">
        <div class="col-8 d-flex align-items-center">
          <h3 class="text-success">作ったクイズの宣伝、またはクイズを解いた感想を掲示板に書き込んでみましょう！➡︎</h3>
        </div> 
        <div class="col-4">
          <a href="/bulletin_boards" class="btn btn-info btn-lg text-white">クイズ掲示板</a>
        </div>
      </div>
    </div><br><br>
  </div>
</template>


<script>
  import axios from 'axios'

  export default {
    data: function() {
      return {
        user: ""
      }
    },
    mounted: function() {
      axios.get('/api/top')
      .then(
        response => (this.user = response.data)
      )
    }
  }
</script>