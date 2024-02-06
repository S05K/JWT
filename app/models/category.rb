class Category < ApplicationRecord
	has_many :subcategories, dependent: :destroy
	has_one_attached :image
end
