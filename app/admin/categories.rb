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
   # config.paginate = false

 
  # controller do
  #   def scoped_collection
  #     end_of_association_chain.paginate(page: params[:page], per_page: 10)
  #   end
  # end


  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end
end
