class UsersController < ApplicationController
  def new
    @user = User.new
    @gifter 
    
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
