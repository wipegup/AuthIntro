Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  post 'login', to: 'session#login'
  get 'login', to: 'session#enter_info'
  post 'logoff', to: 'session#logoff'
  # resources :login, only: [:create, :index]
  get 'user_error', to: 'users#error'
  resources :users, only: [:new, :create, :index]
end
