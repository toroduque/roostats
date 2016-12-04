Rails.application.routes.draw do


  resources :earnings do
    member do
      get :delete
    end
  end


  resources :riders do
    member do
      get :delete
      get :signup
      get :profile
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
