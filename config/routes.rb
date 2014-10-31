Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/home/capture_path', to: 'pokemons#capture', as: :capture
  patch '/trainers/damage_path', to: 'pokemons#damage', as: :damage
  get '/pokemons/new', to: 'pokemons#create', as: :pokemons
end
