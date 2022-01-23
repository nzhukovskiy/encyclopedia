class User < ApplicationRecord
  has_secure_password
  def current_user_id
    session[:current_user_id]
  end
end
