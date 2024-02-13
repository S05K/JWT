class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :name , :id


  # def image_url
  #   if object.image.attached?
  #       # object.images.attached?
  #       # object.image.map do |image|
  #       rails_blob_path(image, only_p
  # ath: true)
  #     end
  #   # end
  # end

  #  def image_url
  #   if object.image.attached?
  #     rails_blob_path(object.image, only_path: true)
  #   end
  # end

  attribute :images do |object, params|  
      host = params[:host] || ""
      if object.images.attached?
        object.images.map { |image|
          {
            id: image.id,
            url: host + Rails.application.routes.url_helpers.rails_blob_url(
              image, only_path: true
            )
          }
        }
      end
    end
end
