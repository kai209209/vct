Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations/registrations'}
  get "vct/chat"
  root "static#index"
end
