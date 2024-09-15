# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  tweet_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
  end
end
