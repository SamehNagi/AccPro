AccPro::Application.routes.draw do

  devise_for :users

  resources :accounts


  resources :transactions

  root :to => 'accounts#index'
end
