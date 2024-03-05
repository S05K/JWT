class AddColumnToBuss < ActiveRecord::Migration[6.0]
  def change
    add_column :buses, :price, :integer
  end
end
