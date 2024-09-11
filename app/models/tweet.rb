class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin
  has_many :likes
  has_many :comments
end
