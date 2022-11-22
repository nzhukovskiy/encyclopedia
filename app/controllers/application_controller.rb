class ApplicationController < ActionController::Base
  before_action :require_login
  def require_login
    if session[:current_user_id] == nil
      redirect_to login_path
    end
  end

end
