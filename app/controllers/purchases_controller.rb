class PurchasesController < ApplicationController
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
end
