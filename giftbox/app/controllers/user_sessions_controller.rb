class UserSessionsController < ApplicationController
  def index
    @users = User.all
  end

  def create
    user = User.new user_params
      if user.save
        if session[:user_id] = user.id
          redirect_to home_path, notice: "Success!" 
        else session[:user_id] = user.id
          redirect_to home_path, notice: "Success!"
        end
      else
        render :signup
      end
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_gifter = User.where(username: params[:username]).first
      if found_gifter
        authorized_gifter = found_gifter.authenticate(params[:password])
          if authorized_profile
            redirect_to profile_shouts_path(authorized_profile)
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
end
