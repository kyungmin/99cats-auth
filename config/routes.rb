Cats99::Application.routes.draw do
  # get "users/new"
  # post "users/create"

  resources :users
  resource :session

  resources :cats do
    resources :cat_rental_requests, :except => [:new, :create] do
      member do
        post 'approve'
        post 'deny'
      end
    end
  end
  resources :cat_rental_requests, :only => [:new, :create]

end