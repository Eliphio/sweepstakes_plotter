SweepstakesPlotter::Application.routes.draw do
  devise_for :users do
    root :to => 'devise/sessions#new'
  end
  
  get 'dashboard' => 'dashboard#index'

  resources :bets, :only => [:index, :create]
  resources :championships do
    collection do
      get :hunchables
    end
  end
  resources :games
  resources :rounds do
    collection do
      get :hunchables
    end
  end
  resources :teams
end
