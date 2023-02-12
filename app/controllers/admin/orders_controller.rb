class Admin::OrdersController < ApplicationController
  
 def show
   @order = Order.find(params[:id])
   @order_detail = @order.order_details
 end
 
  def update
   @order = Order.find(params[:id])
   @order_details = OrderDetail.where(order_id: params[:id])
   if  @order.update(order_params)
       @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
       redirect_to admin_order_path(@order.id)
   else
       render :show
   end
  end
 
 
 private
 
 def order_params
   params.require(:order).permit(:name, :created_at, :address, :payment_method, :status )
 end   
end
