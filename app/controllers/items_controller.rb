class ItemsController < ApplicationController
  def index
    @items = Item.all
    #@items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:items).permit(:price, :name, :category_id, :postage_id, :schedule_id, :source_id, :status_id)
  end

  def destroy
    room = User.find(params[:id])
    room.destroy
    redirect_to root_path
  end
end
