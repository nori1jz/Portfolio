class Public::MakersController < ApplicationController

  def index
    @makers = Maker.page(params[:page])
  end

  def show
    @maker = Maker.find(params[:id])
    @makers = Maker.all
    @items = Item.where(maker_id:@maker.id)
  end
end
