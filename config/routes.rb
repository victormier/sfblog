Sfblog::Application.routes.draw do
  # Backoffice
  namespace :admin do
    resources :posts, except: [:show] do
      resources :post_pictures, only: [:index, :new, :create]
      post :toggle_published, :on => :member
    end
    resources :post_pictures, only: [:destroy] do
      post :sort, :on => :collection
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
