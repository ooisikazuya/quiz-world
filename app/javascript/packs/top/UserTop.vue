<template>
  <div>
    <div class="container">
      <h2 class="text-success" v-for="user in user">ようこそ、{{ user.nickname }}さん！</h2>
    </div><br>
    <div class="container">
      <div class="row"> 
        <div class="col-6">
          <card header="クイズを作成・編集する" text="みんなに楽しんでもらえるようなクイズを考え、作成しましょう。勉強になるクイズや自分の趣味などなんでもOKです。" url="/my_quizzes" button="作成・編集">
          </card>
        </div>
        <div class="col-6">
          <card header="クイズに解答する" text="みんなが作ったクイズにチャレンジしてみましょう。楽しかったクイズには”いいね！”をしましょう。" url="/quizzes/search" button="解答する">
          </card>
        </div>
      </div>
    </div><br>
    <div class="container">
      <div class="row"> 
        <div class="col-12">
          <card header="クイズ掲示板" text="色んなクイズをした感想を書いたり、自分が作ったクイズを宣伝する掲示板です。" url="/bulletin_boards" button="掲示板を見る">
          </card>
        </div>
      </div> 
    </div><br><br>
  </div>
</template>


<script>
  import axios from 'axios'
  var ComponentC = {
    props: ['header', 'text', 'url', 'button'],
    template: '<div class="card border-success"><h5 class="card-header bg-success text-white">{{ header }}</h5><div class="card-body"><h5 class="card-text">{{ text }}</h5><br><a :href="url" class="btn btn-info text-white float-right">{{ button }}</a><br></div></div>'
  }

  export default {
    data: function() {
      return {
        user: null
      }
    },
    mounted: function() {
      axios.get('/api/top')
      .then(
        response => (this.user = response.data)
      )
    },
    components: {
      'card': ComponentC
    }
  }
</script>