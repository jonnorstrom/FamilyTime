class User < ActiveRecord::Base
  has_many :photos
  has_many :comments
  has_many :invitations
  has_many :vacations, through: :invitations
  # attr_accessible :email, :password, :password_confirmation
  # validates_presence_of :password, :on => :create

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
