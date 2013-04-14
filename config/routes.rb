Comedyhack::Application.routes.draw do

  devise_for :users

  match '/auth/:provider/callback' => 'authentications#create'

  namespace :api do
    resources :venues
    resources :events
    resources :places
    post "events/:id/add" => "events#add"
    post "events/:id/delete" => "events#delete"
    resources :users do
      resources :images
      resources :videos
    end
    resources :users
    resources :images
    resources :videos
  end

  resource :users
  root :to => "home#index"
  get '*path' => "home#index"
end
