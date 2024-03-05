class AddSelectedSeatsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :selected_seats, :text
  end
end
