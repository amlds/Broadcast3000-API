Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      devise_for :users, path: "",
                         path_names: {
                           sign_in: "login",
                           sign_out: "logout",
                           registration: "signup",
                         },
                         controllers: {
                           sessions: "api/v1/users/sessions",
                           registrations: "api/v1/users/registrations",
                         }

      get "/current_user", to: "current_user#index"
      resources :courses, only: %i[index show] do
        resources :challenges, only: %i[index show]
      end
      resources :event_types, only: %i[index show update create destroy]
      resources :schools, only: %i[index show create update] do
        resources :events, only: %i[index show update create destroy]
        resources :batchs, only: %i[index show update create destroy]
      end
    end
  end
end
