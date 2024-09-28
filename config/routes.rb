Rails.application.routes.draw do
  devise_for :users, only: [ :sessions, :registrations ]
  devise_scope :user do
    unauthenticated :user do
      root to: "devise/registrations#new", as: :unauthenticated_root
    end
  end
  resources :tweets

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
