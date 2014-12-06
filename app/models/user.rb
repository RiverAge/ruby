class User < ActiveRecord::Base
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :awards, dependent: :destroy
  has_many :duties, dependent: :destroy
  before_save { self.email.downcase! }
  before_save :create_remember_token
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    self.save validate: false

    UserMailer.password_reset(self).deliver
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
