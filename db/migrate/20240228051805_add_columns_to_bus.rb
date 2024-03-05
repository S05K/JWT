class AddColumnsToBus < ActiveRecord::Migration[6.0]
  def change
    add_column :buses, :from, :string
    add_column :buses, :to, :string
  end
end
