Comedyhack::Application.routes.draw do

  devise_for :users

  match '/auth/:provider/callback' => 'authentications#create'

  namespace :api do
    resources :users
  end


  root :to => "home#index"
end
