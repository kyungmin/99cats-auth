require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :user_name, :password, :session_token

  validates :user_name, :password_digest, :session_token, :presence => true
  validates :user_name, :uniqueness => true

  has_many(
  :cats,
  :class_name => "Cat",
  :foreign_key => :user_id,
  :primary_key => :id
  )

  before_validation(on: :create) do
    self.session_token = SecureRandom::urlsafe_base64(16)
  end


  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
#    self.update_attributes({:session_token => self.session_token})
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end
