class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(admin_item_params)
    if @item.save
    tags = Vision.get_image_data(@item.image)    
    tags.each do |tag|
    @item.tags.create(name: tag)
    end

     redirect_to admin_item_path(@item)
    else
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
    @maker = Maker.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(admin_item_params)
      tags = Vision.get_image_data(@item.image)  
      @item.tags.destroy_all
      tags.each do |tag|
      @item.tags.create(name: tag)
      end
    end
    redirect_to admin_item_path(@item)
  end

  private

  def admin_item_params
    params.require(:item).permit(:name, :image, :detail, :maker_id, :genre_id, :price, :user_price, :is_active)
  end

end
