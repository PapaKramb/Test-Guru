Rails.application.routes.draw do

  root to: 'tests#index'

  get 'badges/index'
  get 'users/index'
  get 'users/show'
  get 'user/index'
  get 'user/show'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                                   controllers: { sessions: 'sessions' }

  resources :users, only: :show do
    resources :badges, shallow: true, only: :index
  end

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

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: :index
    resources :badges, only: :index
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
