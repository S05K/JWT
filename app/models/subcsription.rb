class Subcsription < ApplicationRecord
	has_many :assign_subs
  	has_many :users, through: :assign_subs
end
