Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  get 'about' => 'welcome#about', as: :about

  namespace :admin do
    resources :posts do
      resources :comments, only: [:destroy]
    end
  end

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end
end
