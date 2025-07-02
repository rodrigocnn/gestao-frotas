Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check


 namespace :api do
    namespace :v1 do
      resources :trips
      resources :drivers
      resources :vehicles
      resources :fleets

      devise_for :users,
                 path: "users",
                 singular: :user,
                 controllers: {
                   sessions: "api/v1/users/sessions",
                   registrations: "api/v1/users/registrations"
                 },
                 defaults: { format: :json }
    end
  end
end
