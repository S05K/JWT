class Post < ApplicationRecord
	self.table_name= "posts"
	has_and_belongs_to_many :tags
end
