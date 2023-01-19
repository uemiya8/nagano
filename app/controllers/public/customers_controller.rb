class Public::CustomersController < ApplicationController
    
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
    
  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end  
end
