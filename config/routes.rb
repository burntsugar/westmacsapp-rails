Rails.application.routes.draw do
  get 'trail_sites/index'
  get 'start_page/index'
  #  get 'observation/new'
  # get 'observation/edit'
  # get 'observation/update'
  # get 'observation/create'
  # get 'observation/show'
  # get 'observation/destroy'

  resources :observations


  resources :trail_sites

  resources :trail_sites do
    resources :observations
  end


  root 'start_page#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Set a root
end
