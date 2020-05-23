Rails.application.routes.draw do
  resources :ingredients
  
  namespace :api do 
    resources :categories
    resources :users, only: [:create, :show]
    resources :recipes do 
      resources :recipe_ingredients
    end
  end

  get "api/login/status", to: "api/sessions#is_logged_in?"
  post "api/login", to: "api/sessions#create"
  delete "api/logout/:id", to: "api/sessions#destroy"
end
