class Public::OrdersController < ApplicationController
  
  def comfirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.name
      render 'comfirm'
    elsif  params[:order][:select_address] == "1"
    
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    render 'comfirm'
    end
    
   
  end
  
  def new
    @order=Order.new
  end
  
  def create
    @order = Order.new(order_params)
  end
  
  

  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postal_code, :address, :name )
  end
  
end
