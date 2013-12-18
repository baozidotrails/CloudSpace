Place::Application.routes.draw do


  # 登入表單、登入動作、登出動作
  resources :users do
    resources :spaces
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :lots


  # 首頁
  root 'static_pages#home'


  match '/members', to: 'users#index', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end