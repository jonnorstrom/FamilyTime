class Meal < ActiveRecord::Base
  belongs_to :vacation
  belongs_to :user

  def statement
    if self.user_id
      "#{User.find(self.user_id).full_name} has the meal"
    else
      "Unaccounted for - only Admins can sign up"
    end
  end
end
