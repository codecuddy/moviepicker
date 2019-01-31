Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :movies do
      get "/users"       => "user#index"
      get "random"       => "movies#random"
      get "user_random"  => "movies#user_random"
      get "show_clicked" => "movies#show_clicked"
    end
  root "movies#home"


  resources :user_movies do
  end
end
