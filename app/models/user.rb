class User < ActiveRecord::Base
  has_many :photos
  has_many :comments
  has_many :invitations
  has_many :vacations, through: :invitations
  has_secure_password
end
