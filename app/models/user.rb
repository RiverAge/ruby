class User < ActiveRecord::Base

  has_secure_password
  #before_save {|user| user.email = email.downcase}
  before_save {self.email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum:  6}
  validates :password_confirmation, presence: true
end
