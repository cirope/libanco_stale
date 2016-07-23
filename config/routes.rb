Rails.application.routes.draw do
  constraints AdminSubdomain do
    resources :accounts
  end

  constraints AccountSubdomain do
    get '/schedules(/:date)', to: 'schedules#index', as: 'schedules', constraints: { date: /\d{4}\/\d{2}\/\d{2}/ }
    get '/schedules/new(/:date)', to: 'schedules#new', as: 'new_schedule', constraints: { date: /\d{4}-\d{2}-\d{2}/ }
    resources :schedules, only: [:show, :create, :edit, :update, :destroy] do
      patch 'mark_as_done', to: 'schedules#mark_as_done', as: 'mark_as_done', on: :member
    end

    get '/loans(/:filter)', to: 'loans#index', as: 'loans',
      constraints: { filter: 'expired|close_to_expire|not_renewed' }

    # Profiles
    get 'profile', to: 'profiles#edit', as: 'profile'
    patch 'profile', to: 'profiles#update'

    resources :loans, only: [] do
      resources :schedules, only: [:new, :create, :edit, :update]
    end

    get '(/:filter)/reports', to: 'reports#index', as: 'reports',
      constraints: { filter: 'payments' }

    resources :cities
    resources :nacionalities, except: [:show, :destroy]
    resources :states
    resources :users
    resources :companies
    resources :organizations
    resources :tax_settings do
      resources :reports, only: [:index]
    end
    resources :payments, only: [:index]
    resources :customers, except: [:destroy] do
      resources :loans, shallow: true do
        resources :payments, only: [:edit, :update]
      end
    end
    resources :rate_sets do
      get 'simulator', on: :member
    end
  end

  # Sessions
  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :password_resets, only: [:new, :create, :edit, :update]

  root 'sessions#new'
end
