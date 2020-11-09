class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to item_path(@item.id)
    else
      render action: :index
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:number, :exp_month, :exp_year, :cvc, :post_code, :region_id, :city, :address, :building, :phone_num, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end


end
