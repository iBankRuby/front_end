class RegistrationsController < ApplicationController
  include Registrations::SignUp

  def create
    sign_up = SignUp.new(registration_params.to_hash)
    if sign_up.ok?
      redirect_to new_user_session_path, notice: 'You have signed up successfully.'
    else
      redirect_to new_user_registration_path, alert: 'Oops... Something went wrong. Try again later.'
    end
  end

  private

  def registration_params
    params.fetch(:registration).permit(:email, :password, :password_confirmation)
  end
end
