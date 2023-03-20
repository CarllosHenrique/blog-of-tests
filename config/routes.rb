Rails.application.routes.draw do
  devise_for :admins
  root "home#index"
  get 'people/all', to: 'people#all'
  resources :people
end
