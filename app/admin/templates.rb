
include CsvHelper  

ActiveAdmin.register Template do
  permit_params :name, :description, :author

  form do |f|
    f.inputs "CSV Template" do
      f.inputs :name
      f.inputs :description
      f.inputs :author
    end
    f.actions
  end

  action_item only: :index do
    link_to 'Upload CSV', action: 'upload_csv'
  end

  collection_action :upload_csv, method: :get do
    render 'admin/csv/upload_csv'
  end

  collection_action :import_csv, method: :post do  
    templates = CsvHelper.convert_to_templates(params[:dump][:file])
    Template.transaction do
      templates.each(&:save!)
    end
    redirect_to admin_templates_path, notice: 'CSV imported successfully!'
   rescue StandardError => e
    redirect_to admin_templates_path, flash: { error: "CSV import failed: #{e.message}" }
  end
end
