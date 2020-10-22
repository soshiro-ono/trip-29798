class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.references :user,null: false,foreign_key: true
      t.string :title,null: false
      t.string :description,null: false
      t.timestamps
    end
  end
end