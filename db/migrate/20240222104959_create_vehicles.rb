class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :color
      t.string :model

      t.timestamps
    end
  end
end
