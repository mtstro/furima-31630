class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_root


  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to item_path(@item.id)
    else
      render action: :index
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:post_code, :region_id, :city, :address, :building, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: item_order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
  end

end
