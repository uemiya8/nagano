class Public::CustomersController < ApplicationController
    
  def show
    @customer = current_customer
  end
    
  def unsubscribe
    @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end  
end
