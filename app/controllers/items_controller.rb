class ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # def article_params
  # params.require(:items).permit(:price, :name, :image, :category_id, :postage_id, :schedule_id, :source_id, :status_id)
  # end

  def item_params
    params.require(:item).permit(:price, :name, :explanation, :image, :category_id, :postage_id, :schedule_id, :source_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def destroy
    room = User.find(params[:id])
    room.destroy
    redirect_to root_path
  end
end
