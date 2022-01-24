class User < ApplicationRecord
  has_many :notebooks, dependent: :destroy
  validates :username, presence: true
  validates :password, presence: true
end
