class Category < ApplicationRecord
	# self.table_name :categories
	has_many :subcategories, dependent: :destroy
	has_one_attached :image

	# validates :name, format: { with: /\A[\w\s\d!@#\$%^&*()\-+=\[\]{}|\\:;"'<>,.?\/]+\z/,message: "only allows letters, numbers, and special characters" }
	validates :name, format: { with: /[!@#\$%^&*()\-+=\[\]{}|\\:;"'<>,.?\/]/,
    message: "must contain at least one special character" }
end
