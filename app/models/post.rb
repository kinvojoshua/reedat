class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  mount_uploader :photos, PhotoUploader
end
