class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :vacation, foreign_key: true
      t.string :description
      t.string :name

      t.timestamps null: false
    end
  end
end
