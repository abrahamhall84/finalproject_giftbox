class UserSessionsController < ApplicationController
  def index
    @users = User.all
  end

  def create
    user = User.new user_params
      if user.save where :role == "gifter"
        session[:user_id] = user.id
        redirect_to home_path, notice: "Success!" 
      elsif user.save where :role == "giftee"
        session[:user_id] = user.id
        redirect_to home_path, notice: "Success!"  
      else 
        render :signup
      end
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_gifter = User.where(username: params[:username]).first
      found_giftee = User.where(username: params[:username]).first
      if found_gifter
        authorized_gifter = found_gifter.authenticate(params[:password])
          if authorized_gifter
            redirect_to user_path(authorized_gifter)
          else
            flash[:error] = "Your username or password is invalid"
            redirect_to root_path
          end
      elsif found_giftee
        authorized_giftee = found_giftee.authenticate(params[:password])
          if authorized_giftee
            redirect_to user_path(authorized_giftee)
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
    params.require(:profile).permit(:username, :first_name, :last_name, :role, :email, :address, :password, :password_digest)
  end
end
