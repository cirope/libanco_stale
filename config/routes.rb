Finance::Application.routes.draw do
  constraints AdminSubdomain do
    resources :accounts
  end

  constraints AccountSubdomain do
    get '/schedules(/:date)', to: 'schedules#index', as: 'schedules', constraints: { date: /\d{4}\/\d{2}\/\d{2}/ }
    get '/schedules/new(/:date)', to: 'schedules#new', as: 'new_schedule', constraints: { date: /\d{4}-\d{2}-\d{2}/ }
    resources :schedules, only: [:show, :create, :edit, :update, :destroy]

    get '/loans(/:filter)', to: 'loans#index', as: 'loans',
      constraints: { filter: 'expired|close_to_expire|not_renewed' }

    resources :loans, only: [:show, :new, :create, :payments] do
      resources :payments, only: [:index, :edit, :update]
    end

    resources :customers

    # Sessions
    get 'login', to: 'sessions#new', as: 'login'
    post 'sessions', to: 'sessions#create', as: 'sessions'
    delete 'logout', to: 'sessions#destroy', as: 'logout'

    resources :password_resets, only: [:new, :create, :edit, :update]

    # Profiles
    get 'profile', to: 'profiles#edit', as: 'profile'
    patch 'profile', to: 'profiles#update'

    # Resorces
    resources :cities
    resources :states
    resources :users
  end

  root 'sessions#new'
end
