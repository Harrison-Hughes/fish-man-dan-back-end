class User < ApplicationRecord
  
  has_many :orders, dependent: :destroy
  has_many :requests, through: :orders
  has_many :addresses, dependent: :destroy
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {:within => 6..40}
  validates :password_confirmation, presence: true

  def token
    JWT.encode({user_id: self.id}, ENV["FISH_MAN_DAN"])
  end

end
