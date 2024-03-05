class AddOneColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bus_id, :integer, null: true
  end 
end
