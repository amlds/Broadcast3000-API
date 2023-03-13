Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post "auth/login", to: "authentications#login"
      get "display/:display_path", to: "schools#display"

      resources :users
      resources :schools, only: %i[index show create update] do
        resources :events, only: %i[index update create destroy]
        resources :batchs, only: %i[index update create destroy]
      end
    end
  end
end
