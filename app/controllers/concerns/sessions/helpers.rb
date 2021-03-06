module Sessions
  module Helpers
    def session_exist?
      session_exists? && !current_session.nil?
    end

    def current_session
      @session ||= Session.find_by(user_id: session[:current_user_id])
    end

    def refresh_session
      current_session.update(updated_at: Time.now.utc)
    end
  end
end
