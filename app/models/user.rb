class User < ApplicationRecord
  
  has_many :orders, dependent: :destroy
  has_many :requests, through: :orders
  has_many :addresses, dependent: :destroy
  
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def token
    JWT.encode({user_id: self.id}, ENV["CODER"])
  end

end
