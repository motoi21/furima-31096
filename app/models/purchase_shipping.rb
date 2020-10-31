class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, purchase_id: purchase.id)
  end
end