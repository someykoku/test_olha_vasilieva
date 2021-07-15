Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'appointments#new'
  post 'appointments', to: 'appointments#create', as: 'appointments'
  patch 'appointments/:id/finish', to: 'appointments#finish', as: 'finish_appointment'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
