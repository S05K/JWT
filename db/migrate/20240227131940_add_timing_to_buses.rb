class AddTimingToBuses < ActiveRecord::Migration[6.0]
  def change
    add_column :buses, :arrival, :datetime
    add_column :buses, :departure, :datetime
    add_column :buses, :reaching_time, :datetime
  end
end
