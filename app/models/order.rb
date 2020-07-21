class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  validates :email, presence: true
  validates :fullname, presence: true
  validates :cgv, presence: true
  monetize :amount_cents
  monetize :shipping_cents
  monetize :sub_total_cents

  def shipping_cents
    # function to cancel shipping cost  from 60€
    sub_total_cents >= 6000 ? 0 : 390
  end

  def amount_cents
    sub_total_cents + shipping_cents
  end
end
