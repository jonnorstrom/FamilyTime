class Meal < ActiveRecord::Base
  belongs_to :vacation
  belongs_to :user

  def owner
    User.find(self.user_id).full_name
  end
end
