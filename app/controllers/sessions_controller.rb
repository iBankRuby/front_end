class SessionsController < ApplicationController
  include Sessions::Auth

  def new; end

  def create
    auth = Auth.new(user_params.to_hash)
    auth.sign_in
    Session.create(user_id: user_id, access_token: auth.access_token, refresh_token: auth.refresh_token)
    session[:current_user_id] = auth.user_id
  end

  def destroy
    session.delete :current_user_id
  end

  private

  def user_params
    params.fetch(:user).permit(:email, :password)
  end
end
