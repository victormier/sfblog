Sfblog::Application.routes.draw do
  # Backoffice
  namespace :admin do
    resources :posts, except: [:show] do
      post :toggle_published, :on => :member
    end
    resources :users, only: [:index, :new, :create, :destroy]

    root to: 'users#index'
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  # Sessions
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'login' => 'sessions#new', as: 'login'

  root to: 'static#index'
end
