class Public::OrdersController < ApplicationController
  
  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total_fee = 0
    @order.shipping_cost = 800
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      
    elsif  params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    end
  end
  
  def index
   @order = Order.all
   @total_price = 0
  end
  
  def new
    @order=Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @order.save!
    #cart_itemを一つずつ取り出して注文詳細として保存する
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id= @order.id
      @order_detail.item_id = cart_item.item.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount =cart_item.amount
      @order_detail.making_status = 0
      @order_detail.save!
    end 
    #cart_itemを空にする
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end
  
  

  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postal_code, :address, :name, :shipping_cost, :total_payment, :status)
  end
  
end
