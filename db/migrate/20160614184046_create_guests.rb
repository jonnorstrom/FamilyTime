class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :vacation, foreign_key: true
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
