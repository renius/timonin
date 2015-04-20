Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

<<<<<<< HEAD
  get 'about' => 'welcome#about', as: :about
=======
  get 'about' => "welcome#about", as: :about
>>>>>>> 2d53de09a5c11f7524d5fd46d672a6a7190e9853

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
