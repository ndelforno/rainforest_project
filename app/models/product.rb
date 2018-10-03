class Product < ApplicationRecord
  validates :name, presence: { message: "field must be filled out!" }
  validates :description, presence: { message: "field must be filled out!" }
  validates :price_in_cents, presence: { message: "field must be filled out!" }
  validates :price_in_cents, numericality: {only_integer: true}
end
