Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  root "movies#index"
  get "movies"          => "movies#index"
  get "movies/new"      => "movies#new"
  post "movies/new"     => "movies#create"
  get "movies/:id"      => "movies#show"
  get "movies/:id/edit" => "movies#edit"
  put "movies/:id"      => "movies#update"
  delete "movies/:id"   => "movies#destroy"
end
