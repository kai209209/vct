Rails.application.routes.draw do
  root "static#index"
  devise_for :users, :controllers => {registrations: 'registrations/registrations'}
  get "vct/chat"

  resource :user, only: :show
  
end
