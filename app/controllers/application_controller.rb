class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery

  filter_parameter_logging :password, :password_confirmation

  helper_method :current_user_session, :current_user

  private

  def require_user
    unless current_user
      store_location
      redirect_to login_url
      return false
    end
  end

  def store_location
    # TODO Comentado por causa do https. Depois tento arrumar.
    #session[:return_to] = request.request_uri
    session[:return_to] = nil
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

end

