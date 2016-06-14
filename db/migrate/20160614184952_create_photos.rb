class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :user_id
      t.integer :vacation_id
      t.string :description

      t.timestamps null: false
    end
  end
end
