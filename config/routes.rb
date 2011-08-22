SweepstakesPlotter::Application.routes.draw do
  devise_for :users do
    root :to => 'devise/sessions#new'
  end
  
  get 'dashboard' => 'dashboard#index'

  resources :championships
  resources :rounds
  resources :teams
end
