class User < ApplicationRecord

  VALID_EMAIL_REGEX = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i

  has_many :tasks
  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name,  presence: true, length: { maximum: 20 }
  validates :email,      presence: true, length: { maximum: 255 }
  #                        format: { with: VALID_EMAIL_REGEX },
  #                        uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,              presence: true, length: { minimum: 6 }, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  def self.all_except_admin
    where.not(admin: true)
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
