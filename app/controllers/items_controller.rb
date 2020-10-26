class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to root_path
    else render :new 
    end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category,:status, :shipping_charge, :prefecture, :days_to_ship, :price, :image).merge(user_id: current_user.id)
  end
  
end
