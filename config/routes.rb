Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#main'
  get '/project', to: 'static_pages#project'
  get '/task', to: 'static_pages#task'
  get '/user', to: 'static_pages#user'
  get '/main', to: 'static_pages#main'
 
  
  get '/person', to: 'signup#new'
  post 'person', to: 'signup#create'
  get    '/registration',   to: 'sessions#new'
  post   '/registration',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  
  
  resources :signup
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
