Rails.application.routes.draw do
  devise_for :customers

  root "main#index"

  devise_for :admins

  resources :admins
  get '/show_admins', to: 'admins#show_admins'

end
