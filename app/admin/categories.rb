ActiveAdmin.register Category do
  permit_params :name, :image

  index do
    selectable_column
    id_column
    column :name
    column "Image" do |category|
      if category.image.attached?
        image_tag url_for(category.image), style: 'max-width: 100px; max-height: 100px;'
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
