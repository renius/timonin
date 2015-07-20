Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'about' => 'welcome#about', as: :about

  resources :images
    get '/upload_images' => 'images#upload_images', as: :upload_images
    post '/upload' => 'images#upload', as: :upload

  namespace :admin do
    resources :posts do
      resources :comments, only: [:create]
    end
  end

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end
end
