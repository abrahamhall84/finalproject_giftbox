class ItemsController < ApplicationController
  def index
    @items = Item.all
   
  end

  def new
   
  end
  def create
   @user = User.find_by_id(params[:user_id])
    @item = Item.create(item_params)
   @item.save
    redirect_to  user_items_path
  end 
  def show
    @user = User.find_by_id(params[:user_id])
    @item = Item.find_by_id(params[:id])
    @items = Item.all 
    array = @items
    sums = 0
    array.each_with_index do |item, index|
      tempArray = array.dup
      tempArray.each do |diffItem|
        if item['product'] == diffItem['product']
          sums += item + diffItem
        end
      end
    end
    puts sums
  end
  
  def edit
  end
  private
  def item_params
    params.require(:item).permit(:product, :user_id, :give_quantity, :want_quantity, :pick_up, :drop_off) 
  end

  
end
