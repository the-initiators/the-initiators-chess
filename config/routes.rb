Rails.application.routes.draw do

  devise_for :users
	root 'landing_page#index'
	resources :games, only: [:new, :create, :show]
  resources :landing_page, only: [:index, :show, :open_games]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
