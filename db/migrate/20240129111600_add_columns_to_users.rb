class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :otp_code, :string
  end
end
