Rails.application.routes.draw do
  get 'trail_sites/index'
  get 'start_page/index'

  resources :trail_sites

  # Nest observation routes.
  resources :trail_sites do
    resources :observations
  end

  root 'start_page#index'

end
