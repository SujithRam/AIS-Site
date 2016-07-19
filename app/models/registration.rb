class Registration < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { is: 4 }, allow_nil: true
  validates :fmlocation, presence: true, length: { minimum: 2 }
  validates :flightno, presence: true, length: { minimum: 2}
  validates :landingtime, presence: true
end
