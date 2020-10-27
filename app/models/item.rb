class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :status_id
  end
end
