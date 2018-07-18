class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :first_name, presence:  true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
  validates :password, presence: true
end
