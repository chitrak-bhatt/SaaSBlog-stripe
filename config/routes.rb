Rails.application.routes.draw do
  # get 'comments/create'
  # get 'comments/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users
  resources :posts do
    resources :comments
    member do
      delete :delete_file
    end
  end
  resources :webhooks, only: [:create]
  get "pricing", to: "static_pages#pricing"
  get "writeups", to: "static_pages#writeups"
  # get ""
  post "checkout/create", to:"checkout#create", as:"checkout_create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "billing_portal/create", to:"billing_portal#create", as:"billing_portal_create"
  
  # Defines the root path route ("/")
   root "posts#index"
end
