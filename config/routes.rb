Blocitoff::Application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  get "welcome/index"
  get "welcome/about"
  get "welcome/tasks"

  resources :tasks

end