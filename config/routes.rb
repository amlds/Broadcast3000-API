Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post "auth/login", to: "authentications#login"
      resources :users

      resources :schools, only: %i[index show create update] do
        get "/:display_path", to: "schools#display"
        resources :events, only: %i[index update create destroy]
        resources :batchs, only: %i[index update create destroy]
      end
    end
  end
end
