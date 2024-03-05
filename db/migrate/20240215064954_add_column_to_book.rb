class AddColumnToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :activate, :boolean
  end
end
