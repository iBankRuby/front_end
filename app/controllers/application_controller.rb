class ApplicationController < ActionController::Base
  include Sessions::Helpers

  protect_from_forgery with: :exception
  before_action :authorize

  def current_user
    @current_user ||= User.find(session[:current_user_id])
  end

  private

  def authorize
    Session.sweep(20.minutes)
    (redirect_to :new_user_session_url, notice: 'Current session is over.' & return) unless authorized?
    refresh_session
  end

  def authorized?
    session_exist? && session[:current_user_id]
  end
end
