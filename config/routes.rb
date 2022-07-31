Rails.application.routes.draw do
  resources :libraries
  resources :books, only: [:show, :index, :new, :create, :edit, :update]
  root 'welcome#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
   
    
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
