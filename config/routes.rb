Rails.application.routes.draw do
  scope :sign_in do
    get '',  to: 'sessions#new',    as: :new_user_session
    post '', to: 'sessions#create', as: :user_session
  end
  delete '/sign_out', to: 'sessions#destroy', as: :destroy_user_session

  scope :sign_up do
    get '',  to: 'registrations#new',    as: :new_user_registration
    post '', to: 'registrations#create', as: :user_registration
  end
  resource :registrations, only: %i[update destroy], path: ''

  root to: 'some_controller#show'
end
