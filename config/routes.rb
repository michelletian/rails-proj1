Rails.application.routes.draw do
  root to: 'home#index'
  patch '/damage_path', to: 'pokemons#damage', as: :damage
  patch '/heal_path', to: 'pokemons#heal', as: :heal
  devise_for :trainers
  resources :trainers
  patch '/home/capture_path', to: 'pokemons#capture', as: :capture
  resources :pokemons
end
