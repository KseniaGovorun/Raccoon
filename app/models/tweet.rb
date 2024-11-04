# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :bigint           not null
#  origin_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tweet < ApplicationRecord
  scope :ordered_by_creation, -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :origin, class_name: "Tweet", optional: true

  has_many :origin, class_name: "Tweet", foreign_key: :origin_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :body, length: { maximum: 300 }
  validate :unique_retweet_per_user, if: :retweet?

  def retweet?
    if origin_id?
      true
    else
      false
    end
  end

  private

  def unique_retweet_per_user
    if Tweet.exists?(user_id: user_id, origin_id: origin_id)
      errors.add(:base, "You have already retweeted this tweet.")
    end
  end
end
