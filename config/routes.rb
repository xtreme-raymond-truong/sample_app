SampleApp::Application.routes.draw do
  
  # resources :users

  get "users/new"
  match '/signup', to: 'users#new'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root to: 'static_pages#home'
  
end
