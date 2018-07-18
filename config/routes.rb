Rails.application.routes.draw do

  # get 'ingredients/index'
  # get 'ingredients/new'
  # get 'ingredients/edit'
  # get 'ingredients/show'
  # get 'ingredients/delete'
  # # get 'recipes/index'
  # get 'recipes/new'
  # get 'recipes/edit'
  # get 'recipes/show'
  # get 'recipes/delete'
  # get 'restaurants/index'
  # get 'restaurants/show'
  # get 'restaurants/edit'
  # get 'restaurants/new'
  # get 'restaurants/delete'
  root 'restaurants#home'

  devise_for :users

  resources :restaurants


  get 'recipes/add_new_ingredient'
  resources :recipes

  get 'ingredients/get_search_data'
  get 'ingredients/select_search'
  resources :ingredients

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
