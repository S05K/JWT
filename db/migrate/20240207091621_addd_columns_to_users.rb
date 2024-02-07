class AdddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :reason, :string
  end
end
