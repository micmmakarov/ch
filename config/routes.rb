Comedyhack::Application.routes.draw do

  devise_for :users

  match '/auth/:provider/callback' => 'authentications#create'

  namespace :api do
    resources :users do
      resource :images
      resource :videos
    end
    resource :images
    resource :videos
  end


  root :to => "home#index"
  match '*path' => "home#index"
end
