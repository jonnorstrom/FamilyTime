class Meal < ActiveRecord::Base
  belongs_to :vacation
  belongs_to :user
end
