Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :movies do
      get "/users"      => "user#index"
      get "random"      => "movies#random"
    end
  root "user_movies#index"


  resources :user_movies do
    get "random"      => "user_movies#random"
  end
end
