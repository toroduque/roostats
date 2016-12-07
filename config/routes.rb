Rails.application.routes.draw do

  devise_for :riders

  root 'public#index'

  get 'public/index'

  get 'public/about'

  get 'public/tips'

  get 'public/contact'

  resources :earnings do
    member do
      get :delete
    end
  end


  resources :riders do
    member do
      get :delete
      get :profile
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
