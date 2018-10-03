class Product < ApplicationRecord

  has_many :reviews

  def price_in_dollars
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("$%.2f", price_in_dollars)
  end

  validates :name, presence: { message: "field must be filled out!" }
  validates :description, presence: { message: "field must be filled out!" }
  validates :price_in_cents, presence: { message: "field must be filled out!" }
  validates :price_in_cents, numericality: {only_integer: true}
end
