class User < ActiveRecord::Base
  has_many :meals
  has_many :comments
  has_many :invitations
  has_many :vacations, through: :invitations

  has_secure_password
  # attr_accessible :email, :password, :password_confirmation
  # validates_presence_of :password, :on => :create

  def password
    @password ||= ::BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = ::BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def update_password(password)
    self.update(password_digest: ::BCrypt::Password.create(password))
    self.save
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
