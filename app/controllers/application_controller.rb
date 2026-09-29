class ApplicationController < ActionController::Base
  helper_method :current_session
  helper_method :current_user

  helper_method :require_authentication

  private

  def current_session
    return unless cookies.signed[:session_id]

    @current_session ||= Session.find_by(
      id: cookies.signed[:session_id]
    )
  end

  def current_user
    current_session&.user
  end

  def require_authentication
    return if current_user

    redirect_to new_session_path, alert: "Please log in"
  end
end
