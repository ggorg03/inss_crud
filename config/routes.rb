Rails.application.routes.draw do
  resources :workers, :path => "workers"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'workers#index'
end
