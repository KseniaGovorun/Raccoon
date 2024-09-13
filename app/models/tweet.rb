class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :orogin, class_name: "Tweet"

  validates :body, length: { maximum: 300 }
end
