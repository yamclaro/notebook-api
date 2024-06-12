Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :contacts
  resources :kinds
  #resources :auths, only: :create
end
