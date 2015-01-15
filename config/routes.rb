AccPro::Application.routes.draw do

  resources :transactions


  resources :accounts


  resources :account_types


  devise_for :users

  root :to => 'accounts#index'
end
