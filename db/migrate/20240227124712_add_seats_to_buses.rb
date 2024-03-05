class AddSeatsToBuses < ActiveRecord::Migration[6.0]
  def change
    add_column :buses, :seats, :jsonb
  end
end
