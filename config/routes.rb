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
  resources :bulletin_boards, only: [:index, :new, :create] do
    get 'search', on: :collection
  end
  resources :my_quizzes, only: [:index, :new, :create, :edit, :update] do
    member do
      patch 'released'
      patch 'deleted'
    end
  end
  resources :quizzes, only: [:show] do
    resources :likes, only: [:create]
    resources :questions, only: [:destroy] do
      resources :answers, only: [:update]
    end
    collection do
      get 'search'
      get 'like'
    end
    get 'result', on: :member
  end
  root 'top#index'
end
