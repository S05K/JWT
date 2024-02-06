ActiveAdmin.register Category do

  # permit_params :name, :image

  # index do
  #   selectable_column
  #   id_column
  #   column :name
  #   column "Image" do |category|
  #     if category.image.attached?
  #       image_tag url_for(category.image), class: 'admin-thumbnail'
  #     else
  #       "No image attached"
  #     end
  #   end
  #   actions
  # end

  # form do |f|
  #   f.inputs "Category Details" do
  #     f.input :name
  #     f.input :image, as: :file
  #   end
  #   f.actions
  # end
   permit_params :name, :image

  index do
    selectable_column
    id_column
    column :name
    column "Image" do |category|
      if category.image.attached?
        span style: 'max-width: 10px; max-height: 10px;' do
          image_tag url_for(category.image)
        end
      else
        "No image attached"
      end
    end
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end
end
