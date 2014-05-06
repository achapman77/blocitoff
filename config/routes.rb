Blocitoff::Application.routes.draw do
  devise_for :users


  resources :tasks

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end