Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products, shallow: true do
    resources :rentals, except: :index
    resources :charges
    get 'return', to: 'rentals#return'
  end

  resources :rentals, only: :index

  patch '/rentals/:rental', to: 'pages#return_product', as: :return_product
  get '/rentals', to: 'pages#rentals', as: :user_rentals
  get '/search', to: 'products#search', as: :search_product
end
