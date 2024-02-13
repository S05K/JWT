class SubcategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :name, :category_id, :id, :images



   def images
    if object.images.attached?
      object.images.map do |image|
        {
          id: image.id,
          url: rails_blob_url(image, only_path: true)
        }
      end
    end
  end

  
end
