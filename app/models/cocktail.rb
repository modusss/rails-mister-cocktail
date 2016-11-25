class Cocktail < ApplicationRecord
  #make this model to be connected with photouploader form app/uploaders/photo_uploader.rb
  mount_uploader :photo, PhotoUploader
  # should destroy child doses when destroying self
  has_many :doses, dependent: :destroy
  # has many ingredients through doses
  has_many :ingredients, :through => :doses
  validates :name, presence: true, uniqueness: true
end
