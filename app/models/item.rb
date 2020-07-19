class Item < ApplicationRecord
  belongs_to :product
  belongs_to :shop

  has_many :line_items, dependent: :destroy
  monetize :price_cents
end
