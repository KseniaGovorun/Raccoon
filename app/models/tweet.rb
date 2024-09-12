class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin
end
