class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel
end