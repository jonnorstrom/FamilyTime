Rails.application.routes.draw do
  root 'splash#index'
  resources :users

  resources :vacations do
    resources :guests
    resources :attractions
    resources :meals
    resources :topics do
      resources :comments
    end
  end

  post 'sessions/new' => 'sessions#new'
  get 'sessions/destroy' => 'sessions#destroy'
end
