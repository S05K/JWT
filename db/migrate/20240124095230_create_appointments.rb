class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :physician_id
      t.integer :patient

      t.timestamps
    end
  end
end
