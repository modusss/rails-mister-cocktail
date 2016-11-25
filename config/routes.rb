Rails.application.routes.draw do
  resources :cocktails do
    # creating the path
    # /cocktails/:cocktail_id/doses/new
    resources :doses, only: [:new, :create]
  end
  # To be more simple, I want to delete doses with the path /doses/:id
  resources :doses, only: [:destroy]
  # make cocktails's index the first page
  root "cocktails#index"
end
