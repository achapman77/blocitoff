Blocitoff::Application.routes.draw do
  devise_for :users


  resources :tasks

  post 'tasks/completed/:id' => 'tasks#completed', :as => :completed_task

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end