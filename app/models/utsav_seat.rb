class UtsavSeat < ApplicationRecord
  attr_accessor :data
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  TAG_REG = /\A([a-z\s]+)(,\s*[a-z\s]+)*\Z/i
  validates :grpdetails, :allow_blank => true, format: { with: TAG_REG, :message => "Invalid format, Use comma to seperate names." }
  
  def self.search(search)
    where("confirmation LIKE ?", "%#{search}%") 
  end
  
  def self.search1(search)
    where('name LIKE :search OR grpdetails LIKE :search', search: "%#{search}%") 
  end
end
