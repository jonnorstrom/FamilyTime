class Vacation < ActiveRecord::Base
  has_many :photos
  has_many :guests
  has_many :topics
  has_many :attractions
  has_many :invitations
  has_many :users, through: :invitations
end
