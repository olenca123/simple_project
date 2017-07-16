Rails.application.routes.draw do
  get 'static_pages/project'

  get 'static_pages/task'

  get 'static_pages/user'

  get 'static_pages/main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'static_pages#main'

end
