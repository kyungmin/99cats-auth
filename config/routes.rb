Cats99::Application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, :except => [:new, :create]
  end
  resources :cat_rental_requests, :only => [:new, :create]
end