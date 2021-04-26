<template>
  <div>
    <div class="container">
      <h4 class=" text-success">進め方</h4>
      <div class="row">      
        <div class="col-12">
          <div class="card border-success">
            <div class="card-body">
              <ol id="discription">
                <li class="text-success" v-for="discription in discriptions" :key="discription.discription">
                  {{ discription.discription }}
                </li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div><br>
    <div class="container">
      <div class="row">
        <div class="col-6 d-flex align-items-center">
          <h2 class="text-success" v-if="quizzes.quizzes != ''">MYクイズリスト</h2>
        </div>
        <div class="col-6">
          <a class="btn btn-lg btn-info float-right" href="/my_quizzes/new">クイズ作成</a> 
        </div>
      </div><br>
      <div class="row">      
        <div class="col-12">
          <div class="card border-success">
            <div class="card-body">
              <h2 class="text-danger text-center" v-if="quizzes.quizzes == ''">クイズを作成してください。</h2>
              <ul v-for="quizzes in quizzes" :key="quizzes.quizzes">
                <div v-for="(quiz, index) in quizzes" :key="quiz.id">
                  <div class="row">      
                    <div class="col-8">
                      <li class="h3">{{ quiz.title }}</li>
                      <h5>ジャンル：{{ quiz.genre }}</h5>       
                    </div>
                    <div class="col-2 d-flex align-items-center" v-if="quiz.status === 'before_release'">
                      <a class="btn btn-lg btn-info" :href="'/my_quizzes/' + quiz.id + '/edit'">編集</a>
                    </div>
                    <div class="col-2 d-flex align-items-center" v-if="quiz.status === 'before_release' && quiz.has_questions">
                      <a data-confirm="このクイズを公開しますか？" class="btn btn-lg btn-primary" rel="nofollow" data-method="patch" :href="'/my_quizzes/' + quiz.id + '/released'">公開</a>
                    </div>
                    <div class="col-2 d-flex align-items-center" v-if="quiz.status === 'released'">
                      <a data-confirm="このクイズを公開場所から削除しますか？" class="btn btn-lg btn-danger" rel="nofollow" data-method="patch" :href="'/my_quizzes/' + quiz.id + '/deleted'">削除</a>
                    </div>
                    <div class="col-4 d-flex align-items-center" v-if="quiz.status === 'deleted'">
                      <h4 class=" text-success">削除済み</h4>
                    </div>
                  </div><br>
                </div>
              </ul>
            </div>
          </div>
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
        discriptions: [
          { discription: '” クイズ作成 ”ボタンをクリックしてクイズタイトル・ジャンルを作成してください。' },
          { discription: '” 編集 ”ボタンをクリックして問題・選択肢・解説を作成してください。' },
          { discription: '” 公開 ”ボタンをクリックしてみんなにクイズを解いてもらいましょう。ただし、編集はできなくなるので問題の見直しをきちんとしておきましょう。' },
          { discription: 'クイズの公開後表示される” 削除 ”ボタンをクリックするとそのクイズを公開場所から削除することができます。ただし、もう１度公開することができないため、みんなにもう解いてほしくないクイズに対して行ってください。' }
        ],
        quizzes: []
      }
    },
    mounted: function() {
      axios.get('/api/my_quizzes')
      .then(response => {
        this.quizzes = response.data
      })
    }
  }
</script>