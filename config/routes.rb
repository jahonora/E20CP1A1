Rails.application.routes.draw do

	get 'pages/dashboard', to: 'pages#dashboard', as: 'pages_dashboard'
	delete 'user/:id/destroy', to: 'pages#destroy_user', as: 'destroy_user'
	post 'user/:id/make_admin', to: 'pages#make_admin', as: 'make_admin'
	post 'user/:id/kick_admin', to: 'pages#kick_admin', as: 'kick_admin'
	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root to: 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
