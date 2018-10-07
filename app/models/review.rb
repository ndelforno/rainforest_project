class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

    validates :description, presence: { message: "field must be filled out!" }
    validates :product_id, presence: { message: "field must be filled out!" }


end
