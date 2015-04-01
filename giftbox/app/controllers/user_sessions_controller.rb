class UserSessionsController < ApplicationController

  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
      if user.save
        session[:user_id] = user.id
        redirect_to user_path, notice: "Success!"   
      else 
        render :signup
      end
  end

  def attempt_login
   
    user = params[:user]
    if user[:username].present? && user[:password].present?
      found_user = User.where(username: user[:username]).first
      if found_user
        authorized_user = found_user.authenticate(user[:password])
          if authorized_user
            redirect_to user_path(authorized_user)
          else
            flash[:error] = "Your username or password is invalid"
            redirect_to root_path
          end
      else
        flash[:error] = "Your username or password is invalid"
        redirect_to root_path
      end
    else
      flash[:error] = "Please enter a username and password"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_params 
    params.require(:profile).permit(:username, :first_name, :last_name, :is_gifter, :email, :address, :password, :password_digest)
  end
end
