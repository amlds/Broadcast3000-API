Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
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
