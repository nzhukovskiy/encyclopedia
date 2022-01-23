class UsersController < ApplicationController
  skip_before_action :require_login
  def login

  end
  def login_action
    name = params[:name]
    puts name
    password = params[:password]
    puts password
    u = User.find_by(name: name)
    pp u
    if u != nil and u.authenticate(password)
      puts u.id
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
  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
