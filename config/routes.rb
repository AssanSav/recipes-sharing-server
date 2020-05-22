Rails.application.routes.draw do
  resources :ingredients
  resources :recipe_ingredients
  resources :categories
  namespace :api do 
    resources :recipes
    resources :users, only: [:create, :show]
  end

  get "api/login/status", to: "api/sessions#is_logged_in?"
  post "api/login", to: "api/sessions#create"
  delete "api/logout/:id", to: "api/sessions#destroy"
end
