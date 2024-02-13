class CreateSubcsriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subcsriptions do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
