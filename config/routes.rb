Rails.application.routes.draw do
  post "workers/calculate_tax", :to => "workers#calculate_tax"
  resources :workers, :path => "workers"
  root to: 'workers#index'
end
