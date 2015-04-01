class ItemsController < ApplicationController
  def index
    @items = Items.all
    if 

  end

  def new
    @item = Item.new
  end
  def create
    @gifter = Gifter.find_by_id(params[:user_id])
    @item = Item.new gifter_item_params
  end 
  def show
  end
  def calculate_product
    @item_sum = Items.all where params[:product] && params[:drop_off] do 
    if params[:product] == 'apples' && params[:give_quantity] == 'a' where 



  end 

  def edit
  end
  private
  def gifter_item_params
    params.require(:item).permit(:user_id, :product, :give_quantity, :drop_off)
  end 
  def giftee_item_params
    params.require(:item).permit(:user_id, :product, :want_quantity, :pick_up)
  end 
end
