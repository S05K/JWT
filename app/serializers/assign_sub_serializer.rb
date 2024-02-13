class AssignSubSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
  belongs_to :subcsription
  
end
