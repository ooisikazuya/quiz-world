Rails.application.routes.draw do
  get 'quizzes/index'
  get 'quizzes/show'
  resource :user, only: [:show, :edit, :update]
  resources :bulletin_boards, only: [:index, :new]
  resources :my_quizzes, only: [:index, :new, :create, :edit, :update]
  root 'top#index'
end
