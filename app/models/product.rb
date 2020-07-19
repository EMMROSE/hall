class Product < ApplicationRecord
  belongs_to :product_category

  has_many :items, dependent: :destroy

  has_one_attached :photo
end
