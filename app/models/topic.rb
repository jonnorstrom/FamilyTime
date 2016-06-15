class Topic < ActiveRecord::Base
  has_many :comments
  belongs_to :vacation
end
