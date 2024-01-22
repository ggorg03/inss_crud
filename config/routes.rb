require 'sidekiq/web'

Rails.application.routes.draw do
  post "inss_descount", :to => "workers#inss_descount"
  resources :workers, :path => "workers"

  root to: 'workers#index'

  mount Sidekiq::Web => '/sidekiq'
end
