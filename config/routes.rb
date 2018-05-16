Rails.application.routes.draw do
  resources :news
  resources :comments
  resources :topics do
      resources :comments
  	collection do
  		get :listOf
  		get :blocklistOf
  	end
  end
  devise_for :users
  resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end
