class Order < ApplicationRecord
  has_many :requests, dependent: :destroy
  belongs_to :user
end