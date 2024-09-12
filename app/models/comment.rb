class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  valides :body, presence: true, length: { maximum: 500 }
end
