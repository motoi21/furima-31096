class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else 
      render :new
    end
  end
  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id]) 
  end
end
