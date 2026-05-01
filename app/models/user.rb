class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  validates :email_address, presence: true, uniqueness: true
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  has_one_attached :profile_image
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  has_many :books, dependent: :destroy


end
