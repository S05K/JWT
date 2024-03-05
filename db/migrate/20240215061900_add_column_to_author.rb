class AddColumnToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :active, :boolean
  end
end
