class RenamePatientColumnToAppointment < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :patient, :patient_id
  end
end
