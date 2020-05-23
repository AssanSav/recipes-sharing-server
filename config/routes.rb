Rails.application.routes.draw do
  resources :ingredients
  resources :recipe_ingredients
  
  namespace :api do 
    resources :categories
    resources :recipes
    resources :users, only: [:create, :show]
  end

  get "api/login/status", to: "api/sessions#is_logged_in?"
  post "api/login", to: "api/sessions#create"
  delete "api/logout/:id", to: "api/sessions#destroy"
end
