class ItemsController < ApplicationController
  def index
    @items =  
  end

  def destroy
    room = User.find(params[:id])
    room.destroy
    redirect_to root_path
  end
end
