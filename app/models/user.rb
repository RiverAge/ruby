class User < ActiveRecord::Base

  #before_save {|user| user.email = email.downcase}
  before_save {self.email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
end
