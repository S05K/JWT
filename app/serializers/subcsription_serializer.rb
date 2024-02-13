class SubcsriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  
  attributes :users do |i|
    object.user
  end
end
