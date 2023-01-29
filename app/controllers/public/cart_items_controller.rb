class Public::CartItemsController < ApplicationController
  
  def index
    @cart_item = current_customer.cart_items
    @total_fee = 0
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to '/cart_items'
  end
  
  def destroy_all
   cart_item = current_customer.cart_items
   cart_item.destroy_all
   redirect_to '/cart_items'
  end
  
  def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id 
   if @cart_item.save
     redirect_to cart_items_path
   else
    @cart_items = CartItem.all
    render :index
   end
  end
  
  def update
      @cart_item = CartItem.find(params[:id])
     if  @cart_item.update(cart_item_params)
       redirect_to cart_items_path
     else
      @cart_item = cart_item.all
      render :edit
    end
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end  
end
