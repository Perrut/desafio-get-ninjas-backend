Rails.application.routes.draw do
  resources :orders
  post 'orders/start_queue', to: 'orders#start_queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
