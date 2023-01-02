Rails.application.routes.draw do
  
  root "main#index"


  #Admins Routes
  devise_for :admins
  resources :admins, only: [:index, :create, :update, :edit, :new] do
    put :verify_customer
  end
  get '/show_admins', to: 'admins#show_admins'
  get '/manage_customers', to: 'admins#manage_customers'
  get '/manage_offices', to: 'admins#manage_offices'
  #Done

  devise_for :offices
  resources :offices do
    member do
      put :verify_office
      get :own_cars
    end
  end
  get '/own_cars', to: 'offices#own_cars'
  get '/booked_cars', to: 'offices#booked_cars'
  get '/personal_information', to: 'offices#personal_information'
  get '/update_personal_information', to: 'offices#update_personal_information'


  resources :cars do
    member do
      get :show_images
    end
  end

  devise_for :customers
  resources :customers, only: [:destroy, :create, :update, :edit, :new] do
    put :verify_customer
  end

  get '/main_page', to: 'customers#main_page'

end
