Rails.application.routes.draw do
  root 'mains#index'
  resources :posts do
    resources :comments
    resources :assets
    resources :avatars
  end

  resources :articles do
    resources :comments
  end

  resources :videos do
    resources :comments
  end

  resources :events do
    resources :comments
  end

  resources :avatars
end
