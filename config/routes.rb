Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  resource :user, only: [:show, :edit, :update]
  resources :bulletin_boards, only: [:index, :new]
  resources :my_quizzes, only: [:index, :new, :create, :edit, :update] do
    member do
      patch 'released'
      patch 'deleted'
    end
  end
  resources :quizzes, only: [:index, :show] do
    resources :questions, only: :destroy
  end
  root 'top#index'
end
