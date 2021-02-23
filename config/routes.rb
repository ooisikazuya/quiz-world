Rails.application.routes.draw do
  get 'quizzes/index'
  get 'quizzes/show'
  get 'quizzes/new'
  get 'quizzes/create'
  get 'quizzes/edit'
  get 'quizzes/update'
  get 'bulletin_boards/index'
  get 'bulletin_boards/new'
  get 'users/show'
  get 'users/edit'
  get 'top/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
