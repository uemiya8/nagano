class Public::OrdersController < ApplicationController
  
  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total_fee = 0
    @order.shipping_cost = 800
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    elsif  params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    end
  end
  
  def index
   @order = Order.all
   
  end
  
  def new
    @order=Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end
  
  

  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postal_code, :address, :name )
  end
  
end
