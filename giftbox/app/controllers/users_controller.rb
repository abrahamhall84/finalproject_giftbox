class UsersController < ApplicationController
  def create
    @user= User.new user_params
    if @role == 'gifter'
      @user.role = 'gifter'
    elsif @role == 'giftee'
      @user.role = 'giftee'
    end 
    if @user.save
        if @user.role == 'gifter'
        redirect_to 
       elsif @user.role == 'giftee'
        redirect_to 
        end
    else 
        render :new
    end
    def edit
        @user = User.find_by_id(params[:id])
    end
  end 

 class Gifter < User
    def index

    end

    def new
        @gifter = Gifter.new
    end

    def show
        @gifter = Gifter.find_by_id(params[:id])
    end
    def update
    @gifter = giftee.find_by_id(params[:id])
        if @user.update_attributes user_params
            redirect_to user_path @user, notice: "Successfully edited"
        else
            flash[:error] = "Your information is incomplete"
            redirect_to edit_user_path
        end
    end

  def destroy
    @gifter = gifter.find_by_id(params[:id])
    @gifter.delete        
    redirect_to root_path
  end
 end
 class Giftee < User
    def index
    end
    def new
        @giftee = Giftee.new
    end

    def show
        @giftee = Giftee.find_by_id(params[:id])
        @products = Items.all where params[:product]
        @products = Items.sort_by params[:drop_off]
         if params[:drop_off] == 'a'


    end

    def edit
        @giftee = Giftee.find_by_id(params[:id])
    end
    def update
    @giftee = giftee.find_by_id(params[:id])
        if @giftee.update_attributes user_params
            redirect_to user_path @giftee, notice: "Successfully edited"
        else
            flash[:error] = "Your information is incomplete"
            redirect_to edit_user_path
        end
    end

  def destroy
    @giftee = giftee.find_by_id(params[:id])
    @giftee.delete        
    redirect_to root_path
  end
 end
  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :role, :email, :address, :password, :password_digest) 
  end
  def set_role_type
    # We ensure that the account_type coming from the registration form is valid
    raise 'Error message OR for validation error' unless %w[gifter giftee].include? params[:role]
    @role = params[:role]
  end


    end
end 
