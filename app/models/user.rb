class User < ApplicationRecord
  has_secure_password
  has_many :histories
  has_many :articles, through: :histories
  has_many :comments
  has_many :articles, through: :comments
  def current_user_id
    session[:current_user_id]
  end
end
