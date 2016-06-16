class UpdateUsersTable < ActiveRecord::Migration
  def change
    add_column(:users, :is_admin, :boolean)
    add_column(:users, :email, :string)
  end
end
