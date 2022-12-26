class Admin::CustomersController < ApplicationController
  
  def index
   @customer = Customer.all
  end
  
  def show
   @customer = Customer.find(params[:id])
  end
  
  def edit
   @customer = Customer.find(params[:id])
  end
  
  private
  
  def customer_params
   params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address,)
  end
end
