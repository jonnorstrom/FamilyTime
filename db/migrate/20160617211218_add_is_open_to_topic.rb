class AddIsOpenToTopic < ActiveRecord::Migration
  def change
    add_column(:topics, :is_open, :boolean, :default => true)
  end
end
