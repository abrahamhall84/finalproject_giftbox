class ItemsController < ApplicationController
  attr_accessor :product, :give_quantity, :want_quantity

  def intialize
    @product = product
    @give_quantity = give_quantity
    @want_quantity = want_quantity
  end 

  def index
    @items = Item.all
    @user = User.find_by_id(params[:user_id])
    @sums = 0

    @items.each_with_index do |item, index|
      tempArray = @items.dup
      tempArray.each do |diffItem|
        if item[:product] == diffItem[:product]

          @sums = item[:give_quantity] + diffItem[:give_quantity]
        end
      end
    return @sums
    # redirect_to user_items_path
    end
  end


  def give_product()

    @product = Product.find_by_
    

  end  

  def new
   @user = User.new
  end

  def create
   @user = User.find_by_id(params[:user_id])
    @item = Item.create(item_params)
   @item.save
    redirect_to  user_items_path(@user)
  end 

  def show
    @user = User.find_by_id(params[:user_id])
    @item = Item.find_by_id(params[:id])
  end
  
  def edit
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @item = Item.find_by_id(params[:id])
    @item.delete
    redirect_to user_items_path(@user)
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @item = Item.find_by_id(params[:id])
    # @items = Item.all 
    # @sums = 0
    # @items.each_with_index do |item, index|
    #   tempArray = @items.dup
    #   tempArray.each do |diffItem|
    #     if item[:product] == diffItem[:product]
    #       @sums += item[:give_quantity] + diffItem[:give_quantity]
    #     end
    #   end
    # end
    # return @sums
    # redirect_to user_item_path
  end
  
  def edit

  end

  private
  def item_params
    params.require(:item).permit(:product, :user_id, :give_quantity, :want_quantity, :pick_up, :drop_off) 
  end

  
end
