class User < ActiveRecord::Base
  has_many :photos
  has_secure_password
end
