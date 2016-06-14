class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.references :vacation, foreign_key: true
      t.string :name
      t.string :weblink
      t.string :location

      t.timestamps null: false
    end
  end
end
