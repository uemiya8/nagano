class Public::CustomersController < ApplicationController
    
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def create
    @customer = current_customer
    if @customer.save
      redirect_to customer_path(@customer.id)
    else
     @customer = Customer.all
     render :edit
    end
  end
  
  def update
    @customer = current_customer
     if  @customer.update(customer_params)
       redirect_to customers_my_page_path
     else
      @customer = Customer.all
      render :edit
     end
  end
  
  
    
  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end  

private

def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,  :postal_code, :address, :telephone_number, :email)
  
end
end
