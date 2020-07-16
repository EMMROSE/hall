class Shop < ApplicationRecord
  belongs_to :owner
  belongs_to :shop_category
end
