Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :properties, only: [:index, :show, :create, :edit, :update] do
    collection do
      get "search"

    end
    get 'addresses/autocomplete', to: 'addresses#autocomplete'
  end

  resources :projects, only: [:show, :new, :create] do
    resources :simulations, only: [:show, :new, :create] do
      member do
        post 'save'
      end
    end
  end

  resources :cities, only: [:show]
  get "dashboard", to: "dashboard#profile"
  resources :simulations, only: [:show] do
    resources :leads, only: [:new, :create]
  end

  get 'addresses/autocomplete', to: 'addresses#autocomplete'
  delete "projects/:id", to: "projects#destroy"
  delete "properties/:id", to: "properties#destroy"
end
