class Review < ApplicationRecord
  belongs_to :product

    validates :description, presence: { message: "field must be filled out!" }
    validates :product_id, presence: { message: "field must be filled out!" }


end
