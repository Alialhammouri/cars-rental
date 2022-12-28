Rails.application.routes.draw do
  

  resources :cars
  get '/own_cars', to: 'offices#own_cars'

  root "main#index"

  
  devise_for :offices
  resources :offices do
    member do
      get :own_cars
    end
  end

  resources :customers
  devise_for :customers
  get '/main_page', to: 'customers#main_page'


  devise_for :admins
  resources :admins
  get '/show_admins', to: 'admins#show_admins'
  get '/manage_customers', to: 'admins#manage_customers'
  get '/manage_offices', to: 'admins#manage_offices'
  patch '/verify_customer', to: 'admins#verify_customer'

end
