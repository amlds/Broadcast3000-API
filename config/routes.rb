Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # Action cable server
      mount ActionCable.server => "/cable"

      # Authentication
      post "auth/login", to: "authentications#login"

      # Display
      get "display/:display_path", to: "schools#display"

      # Users
      resources :users

      # Schools
      resources :schools, only: %i[index show create update] do
        resources :events, only: %i[index create]
        resources :batchs, only: %i[create]
      end
      resources :events, only: %i[update destroy]
      resources :batchs, only: %i[update destroy]
    end
  end
end
