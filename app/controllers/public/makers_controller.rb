class Public::MakersController < ApplicationController
  
  def index
    @makers = Maker.all
  end  
  
  def show
    
  end  
end
