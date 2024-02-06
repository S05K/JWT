class ChangeDataTypeInUsers < ActiveRecord::Migration[6.0]
  def change
     change_column :users, :stripe_customer_id, :string
  end
end
