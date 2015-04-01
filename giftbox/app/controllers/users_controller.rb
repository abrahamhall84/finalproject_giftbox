class UsersController < ApplicationController
  
  def create
    @user= User.new user_params
    if @role == 'gifter'
      @user.role = 'gifter'
    elsif @role == 'giftee'
      @user.role = 'giftee'
    end 
    if @user  
  end 
end
class Gifter < User
    def index

    end

    def new

    end

    def show
    end

    def edit
    end
end
class Giftee < User
    def index
    end

    def new
    end

    def show
    end

    def edit
    end
  end
end
