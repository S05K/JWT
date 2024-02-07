class AddddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
        add_column :users, :value, :boolean, default: false
  end
end
