class SessionsController < ApplicationController
  include Sessions::Auth

  def new; end

  def create
    if (auth = Auth.new(user_params.to_hash))
      Session.create(user_id: user_id, access_token: auth.access_token, refresh_token: auth.refresh_token)
      session[:current_user_id] = auth.user_id
      # TODO: May be cause of exception.
      redirect_to :home, notice: 'You have successfully signed in!'
    else
      redirect_to :new_user_session, alert: 'Unfortunately, you are not signed in. Try again.'
    end
  end

  def destroy
    Session.find_by(user_id: current_user.id).destroy
    session.delete :current_user_id
  end

  private

  def user_params
    params.fetch(:user).permit(:email, :password)
  end
end
