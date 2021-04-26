/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import Top from './top/top.vue'
import UserTop from './top/UserTop.vue'
import MyQuizzes from './my_quizzes/MyQuizzes.vue'
import EditMyQuiz from './my_quizzes/EditMyQuiz.vue'

document.addEventListener('turbolinks:load', () => {
  var top = new Vue({
    el: '#top',
    components: {
      'top': Top
    }
  })

  var userTop = new Vue({
    el: '#user-top',
    components: {
      'user-top': UserTop
    }
  })

  var pageTitle = new Vue({
    el: '#page-title',
    data: {
      styles: {
        backgroundColor: '#ffc107',
        color: 'white',
        textAlign: 'center'
      }
    }
  })

  var myQuizzes = new Vue({
    el: '#my-quizzes',
    components: {
      'my-quizzes': MyQuizzes
    }
  })


  var　editMyQuiz = new Vue({
    el: '#edit-my-quiz',
    components: {
      'edit-my-quiz': EditMyQuiz
    }
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
