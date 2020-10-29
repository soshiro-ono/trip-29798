class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.references :user,null: false,foreign_key: true
      t.string :title,null: false
      t.string :description,null: false
      t.integer :city_id, null: false

      t.timestamps
    end
  end
end
