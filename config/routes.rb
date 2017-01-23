Rails.application.routes.draw do
  get 'friends_relationships/index'

  root "static#index"
  devise_for :users, :controllers => {registrations: 'registrations/registrations'}
  get "vct/chat"

  resource :user, only: [:show] do
    collection do
      post :update_name, :update_password
      get :search
    end
  end

  resources :friends_relationships, only: [:index]

  resources :applies, only: [:index, :create] do
    collection do 
      get :apply, :my_applies
      patch :reapply, :operate_apply
    end 
  end
  
end
