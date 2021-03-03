Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                                   controllers: { sessions: 'sessions' }

  resources :tests, only: :index do
    resources :questions, shallow: true, exept: :index do
      resources :answers, shallow: true, exept: :index
    end

      post :start, on: :member

  end

  resources :completed_tests, only: %i[show update] do
    resource :gists, only: :create
    member do
      get :result
      post :gist
    end
  end

  resources :badges, only: :index do
    get :current, on: :collection
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: :index

    resources :badges do
      get :current, on: :collection
    end
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
