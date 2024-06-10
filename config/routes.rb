Rails.application.routes.draw do
  resources :phones
  resources :kinds
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :contacts
end
