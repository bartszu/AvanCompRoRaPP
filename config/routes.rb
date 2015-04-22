Rails.application.routes.draw do

get 'transactions/new'
get 'carts/endd'
get 'carts/show'
get 'carts/some'
get 'some/noti'
get 'ano/create'

devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

resources :products, only: [:show, :index]
resources :some, only: [:noti]
resources :transactions, only: [:new, :create,]
resources :ano, only: [:create]

resource :cart, only: [:show, :endd] do
put 'add/:product_id', to: 'carts#add', as: :add_to
put 'remove/:product_id', to: 'carts#remove', as: :remove_from
end

root 'products#index'
end


