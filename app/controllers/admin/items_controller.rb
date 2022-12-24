class Admin::ItemsController < ApplicationController
 
 def new
  @item = Item.new
 end
 
 def index
  @item = Item.new
  @items = Item.all
 end
 
 def show
  @item = Item.find(params[:id])
 end
 
 def create
  item = Item.new(item_params)
  item.save
  redirect_to admin_items_path
 end
 
 private
 
 def item_params
  params.require(:item).permit(:name, :image, :genre_id, :price, :is_active, :introduction)
 end
end
