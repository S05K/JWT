class Category < ApplicationRecord
	# self.table_name :categories
	has_many :subcategories, dependent: :destroy
	has_one_attached :image
end
