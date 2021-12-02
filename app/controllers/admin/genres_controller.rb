class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).reverse_order
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(admin_genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end  

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(admin_genre_params)
    redirect_to admin_genres_path, notice: 'Genre was successfully updated.'
  end


  private
  def admin_genre_params
    params.require(:genre).permit(:name)
  end
end

