class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.integer :gallery_id
      t.timestamps
    end
    add_index :paintings, [:gallery_id, :created_at]
  end
end
