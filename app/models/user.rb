class User < ApplicationRecord
  # Include default devise dules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:username]

  # has_secure_password
  def will_save_change_to_email?
    false
  end

  has_many :posts
  has_many :comments
  has_many :votes

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username, presence: true,
                       uniqueness: true

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }

  validates :password, presence: true
end
