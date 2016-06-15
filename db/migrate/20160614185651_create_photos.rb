class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :vacation, foreign_key: true
      t.string :name
      t.string :descrioption
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
