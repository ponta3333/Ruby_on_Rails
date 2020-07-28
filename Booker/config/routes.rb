Rails.application.routes.draw do
  root 'books#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users, only: [:show, :index]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
