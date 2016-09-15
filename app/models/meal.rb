class Meal < ActiveRecord::Base
  belongs_to :vacation
  belongs_to :user

  def statement
    user_id ? "Claimed by #{User.find(user_id).full_name}" : "Unaccounted for - only Admins can sign up"
  end
end
