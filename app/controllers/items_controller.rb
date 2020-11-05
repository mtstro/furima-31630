class ItemsController < ApplicationController

  def index
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
  def item_params
    params.require(:item).permit(:image, :name, :about, :category_id, :status_id, :ship_cost_id, :region_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end
end
