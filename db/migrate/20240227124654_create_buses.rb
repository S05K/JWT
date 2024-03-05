class CreateBuses < ActiveRecord::Migration[6.0]
  def change
    create_table :buses do |t|
      t.integer :number

      t.timestamps
    end
  end
end
