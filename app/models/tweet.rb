class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: "Tweet", foreign_key: "origin_id"

  has_one :origin, class_name: "Tweet", foreign_key: "origin_id"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :body, length: { maximum: 300 }
end
