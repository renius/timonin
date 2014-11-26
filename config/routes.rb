Rails.application.routes.draw do
  root 'welcome#index'

  resources :images
    get '/upload_images' => 'images#upload_images', as: :upload_images
    post '/upload' => 'images#upload', as: :upload

  namespace :admin do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    resources :comments
  end
end
