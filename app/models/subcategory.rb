class Subcategory < ApplicationRecord
  belongs_to :category
  has_many_attached :images
end
