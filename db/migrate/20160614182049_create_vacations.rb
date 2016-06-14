class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :location
      t.datetime :start
      t.datetime :end
      t.string :name
      t.timestamps null: false
    end
  end
end
