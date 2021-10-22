class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @item_counts = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
end
