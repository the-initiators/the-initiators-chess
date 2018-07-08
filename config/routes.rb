Rails.application.routes.draw do

  devise_for :users
	root 'landing_page#index'

	resources :games, only: [:new, :create, :show]
  
	resources :games, only: [:new, :create, :show] do 
		resources :pieces
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
