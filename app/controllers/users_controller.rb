class UsersController < ApplicationController
  skip_before_action :require_login, only: [:login, :login_action]

  def login

  end
  def login_action
    name = params[:name]
    password = params[:password]
    u = User.find_by(name: name)
    if u != nil and u.authenticate(password)
      session[:current_user_id] = u.id
      redirect_to root_path
    else
      puts "ERROORROROO"
    end
  end
  def logout
    session[:current_user_id] = nil
    redirect_to login_path
  end
  def profile
    @user = User.find(params[:id])
  end
  def leaders

  end
  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
