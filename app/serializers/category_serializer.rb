class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :name , :id, :image_url


   def image_url
    if object.image.attached?
      rails_blob_path(object.image, only_path: true)
    end
  end

end
