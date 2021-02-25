Rails.application.routes.draw do
  resource :user, only: [:show, :edit, :update]
  resources :bulletin_boards, only: [:index, :new]
  resources :my_quizzes, only: [:index, :new, :create, :edit, :update]
  resources :quizzes, only: [:index, :show]
  root 'top#index'
end
