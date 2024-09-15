# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :bigint           not null
#  origin_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: "Tweet", foreign_key: "origin_id"

  has_one :origin, class_name: "Tweet", foreign_key: "origin_id"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :body, length: { maximum: 300 }
end
