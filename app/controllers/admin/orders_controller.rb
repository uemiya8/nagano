class Admin::OrdersController < ApplicationController
  
 def show
   @order = Order.find(params[:id])
 end
 
 def order_params
   params.require(:order).permit(:name, :created_at, :address, :payment_method, :status)
 end   
end
