class CreateAssignSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :assign_subs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subcsription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
