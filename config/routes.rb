require 'sidekiq/web'

Rails.application.routes.draw do

  resources :device_coordinates
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'

  resources :profiles
  resources :race_scorings
  resources :users
  
  get '/races/open', to: 'races#open'

    resources :competitions do
		resources :groups do
			resources :competitors
			resources :scorings do
  				collection do
    				get 'testing'
  				end
			end
			resources :fleets do
				resources :races do
					resources :race_competitors
					resources :race_scorings do
						collection do
    						get 'testing'
  						end
					end
					resources :metrics do
						resources :finishes
					end
				end
			end
		end
	end
end
