# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  tweet_id   :bigint           not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(300) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
  end
end
