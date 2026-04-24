class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  validates :email_address, presence: true, uniqueness: true
  
  has_one_attached :image
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_many :books, dependent: :destroy
end
