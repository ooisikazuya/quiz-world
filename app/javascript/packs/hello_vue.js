/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import Top from './top/top.vue'

document.addEventListener('turbolinks:load', () => {
  var vue = new Vue({
    el: '#top',
    components: {
      'top': Top
    }
  })

  var vue1 = new Vue({
    el: '#discription',
    data: {
      discriptions: [
        { discription: '” クイズ作成 ”ボタンをクリックしてクイズタイトル・ジャンルを作成してください。' },
        { discription: '” 編集 ”ボタンをクリックして問題・選択肢・解説を作成してください。' },
        { discription: '” 公開 ”ボタンをクリックしてみんなにクイズを解いてもらいましょう。ただし、編集はできなくなるので問題の見直しをきちんとしておきましょう。' },
        { discription: 'クイズの公開後表示される” 削除 ”ボタンをクリックするとそのクイズを公開場所から削除することができます。ただし、もう１度公開することができないため、みんなにもう解いてほしくないクイズに対して行ってください。' }
      ]
    }
  })

  var vue2 = new Vue({
    el: '#page-title',
    data: {
      styles: {
        backgroundColor: '#ffc107',
        color: 'white',
        textAlign: 'center'
      }
    }
  })

  var vue3 = new Vue({
    el: '#important-points',
    data: {
      points: [
        { point: '＊問題は最大で１００問作成できます。' },
        { point: '＊選択肢は問題毎に２〜５択に調節できます。' },
        { point: '＊正解の選択肢を複数に設定することができません。' }
      ]
    }
  })

  Vue.component('card', {
    props: ['header', 'text', 'url', 'button'],
    template: '<div class="card border-success"><h5 class="card-header bg-success text-white">{{ header }}</h5><div class="card-body"><h5 class="card-text">{{ text }}</h5><br><a :href="url" class="btn btn-info text-white float-right">{{ button }}</a><br></div></div>'
  })
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
