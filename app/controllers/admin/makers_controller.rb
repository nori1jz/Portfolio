class Admin::MakersController < ApplicationController

  def new
    @maker = Maker.new
  end

  def show
    @maker = Maker.find(params[:id])
  end

  def create
    maker = Maker.new(admin_maker_params)
    maker.save
    redirect_to admin_maker_path(maker[:id])
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    @maker.update(admin_maker_params)
    redirect_to admin_maker_path, notice: 'Maker was successfully updated.'
  end

  def index
    @makers = Maker.all
  end

  private
  def admin_maker_params
    params.require(:maker).permit(:name, :telephone_number, :email, :fax_number, :is_active)
  end







end
