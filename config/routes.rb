# /config/routes.rb
Rails.application.routes.draw do
  resources :trail_sites do
    resources :observations, module: :trail_sites
  end
  resources :facility do
    resources :observations, module: :facility
  end
  root 'start_page#index'
end
