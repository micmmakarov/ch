Comedyhack::Application.routes.draw do

  devise_for :users

  match '/auth/:provider/callback' => 'authentications#create'

  namespace :api do
    resources :users do
      resource :images
      resource :videos
    end
    resources :users
    resource :images
    resource :videos
  end

  resource :users
  root :to => "home#index"
  get '*path' => "home#index"
end
