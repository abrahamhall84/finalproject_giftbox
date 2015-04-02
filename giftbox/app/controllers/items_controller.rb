class ItemsController < ApplicationController
  def index
   
  end

  def new
   
  end
  def create
   @user = User.find_by_id(params[:user_id])
    @item = Item.create(item_params)
   @item.save
    redirect_to  :controller => :user, :action => :show
  end 
  # def create
#   @user = User.new(params[:user])
#   if @user.save
#     redirect_to :action => :index
#   else
#     @title = "Sign up"
#     render 'new'
#   end
# end
  def show
    
    @item_sum = Item.all.where item[:product] #params[:collection] 
      # add all item.give_quantity

    @item_sum.each do |item|
     if item.give_quantity

      # add all 
     else 
      item.want_quantity
      #subtract amt  
    end
    end
  end
  
  def edit
  end
  private
  def item_params
    params.require(:item).permit(:product, :user_id, :give_quantity, :want_quantity, :pick_up, :drop_off) 
  end

  
end
