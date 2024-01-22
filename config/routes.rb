require 'sidekiq/web'

Rails.application.routes.draw do
  post "inss_descount", :to => "workers#inss_descount"
  resources :workers, :path => "proponentes"

  root to: 'workers#index'

  mount Sidekiq::Web => '/sidekiq'
end
