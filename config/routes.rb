Rails.application.routes.draw do
  root "static#index"
  devise_for :users, :controllers => {registrations: 'registrations/registrations'}
  get "vct/chat"

  resource :user, only: [:show] do
    collection do
      post :update_name, :update_password
      get :search
    end
  end

  resources :applies, only: [:index, :create] do
    collection do 
      get :apply
      post :operate_apply
      patch :reapply
    end 
  end
  
end
