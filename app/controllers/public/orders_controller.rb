class Public::OrdersController < ApplicationController
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postal_code, :address, :name )
  end
  
end
