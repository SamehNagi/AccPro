AccPro::Application.routes.draw do

  resources :accounts


  resources :transactions


  devise_for :users

  root :to => 'accounts#index'
end
