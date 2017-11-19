Rails.application.routes.draw do
  root to: 'pages#home'

  # USER LOGIN
  devise_for :users

  get 'contacts/new'

  get 'about', to: 'pages#about'
  get 'clients', to: 'pages#clients'

  # CONTACTS
  resources :contacts, only: [:create]
  get 'contact-us', to: 'contacts#new', as: 'new_contact'

  get 'login', to: 'pages#login'
  get 'products', to: 'pages#products'
  get 'services', to: 'pages#services'
  
end
