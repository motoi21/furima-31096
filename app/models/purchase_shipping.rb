class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

end