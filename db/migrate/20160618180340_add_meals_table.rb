class AddMealsTable < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.integer :vacation_id
      t.date :day
      t.timestamps null: false
    end
  end
end
