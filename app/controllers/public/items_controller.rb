class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @favorite = Favorite.new
  end
  
  def show
    @item = Item.find(params[:id])
    @favorite = Favorite.new
  end
  
end
