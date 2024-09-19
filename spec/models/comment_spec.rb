# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  tweet_id   :bigint           not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_most(300) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
  end
end
