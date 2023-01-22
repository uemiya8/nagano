class Public::ItemsController < ApplicationController
  
  def index
    @item = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def create
   @item = Item.new(item_params)
   if @item.save
     redirect_to items_path
   else
    @items = Item.all
    render :index
   end
  end
  
  def update
    @item =Item.find(params[:id])
  end
  
  
  
end
 

