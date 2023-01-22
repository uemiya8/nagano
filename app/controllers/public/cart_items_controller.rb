class Public::CartItemsController < ApplicationController
  
  def index
    @cart_item = CartItem.all
    @total_fee = 0
  end
  
  def create
   @cart_item = CartItem.new(cart_item_params)
   if @cart_item.save
     redirect_to cart_items_path
   else
    @cart_items = CartItem.all
    render :index
   end
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end  
end
