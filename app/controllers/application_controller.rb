class ApplicationController < ActionController::Base
  def current_user
    return nil if session[:user_id].nil?
    @current_user ||=
      User
      .where(uuid: session[:user_id])
      .first_or_create(uuid: session[:user_id])
  end
  helper_method :current_user
end
