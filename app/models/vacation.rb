class Vacation < ActiveRecord::Base
  has_many :guests
  has_many :topics
  has_many :attractions
end
