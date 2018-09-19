class User < ApplicationRecord
  VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name,  presence: true, length: { maximum: 20 }
  validates :email,      presence: true, length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX },
                         uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,   presence: true, length: { minimum: 6 }
end
