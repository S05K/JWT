ActiveAdmin.register Subcategory do
  permit_params :name, :category_id, images: []

  index do
    selectable_column
    id_column
    column :name
    column :category_id
    column "Images" do |subcategory|
      subcategory.images.each do |image|
        span do
          image_tag url_for(image.variant(resize: "200x200"))
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :category_id
      row "Images" do |subcategory|
        subcategory.images.each do |image|
          span do
            image_tag url_for(image.variant(resize: "1000x1000"))
          end
        end
      end
    end
  end
end

