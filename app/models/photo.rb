class Photo < ActiveRecord::Base
  belongs_to :vacation
  belongs_to :user
end
