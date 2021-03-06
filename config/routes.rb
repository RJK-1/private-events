Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
  resources :events
  resources :users, only: [:show, :create, :destroy]
  get "/attendees/new/:id", to: "attendees#create"
  delete "/attendees/:id", to: "attendees#destroy"
end
