Rails.application.routes.draw do
  resources :images
  resources :idols
	root 'articles#index'
  	

  	resources :articles
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	
  	
  	devise_for :admins, path: 'admins', controllers: 
  	{
  		registrations: 	'admins/registrations',
  		sessions: 		'admins/sessions',
  		confirmations: 	'admins/confirmations',
  		passwords: 		'admins/passwords',
  		unlocks: 		'admins/unlocks'

  		# Not including omniauth because it's not enabled in the Admin Model
  		# ,omniauth_callbacks: 'admins/omniauth_callbacks'
  	}


    devise_for :users, path: 'users', controllers:
    {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks'
    }
end
