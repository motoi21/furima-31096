class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]
  before_action :move_to_index, only:[:index, :create]


  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      Payjp.api_key = "sk_test_1eea521a3929225a8b7a6158"
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_shipping.save
      redirect_to root_path
    else 
      render :index
    end
  end
  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    elsif Purchase.existss?(item_id: @item.id)
      redirect_to root_path
    end
  end

end