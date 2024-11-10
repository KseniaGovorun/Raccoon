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

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:user) { create(:user) }
  let!(:tweet1) { create(:tweet, user: user) }
  let!(:tweet2) { create(:tweet, user: user) }


  context "validations" do
    it { is_expected.to validate_length_of(:body).is_at_most(300) }

    it "validates uniqueness of retweet per user" do
      create(:tweet, user: user, origin_id: tweet1.id)
      duplicate_retweet = Tweet.new(user: user, origin_id: tweet1.id)

      expect(duplicate_retweet).not_to be_valid
      expect(duplicate_retweet.errors[:base]).to include("You have already retweeted this tweet.")
    end

    it "allows retweet if origin_id is nil for the same user" do
      another_tweet = create(:tweet, user: user)
      retweet = Tweet.new(user: user, origin_id: another_tweet.id)

      expect(retweet).to be_valid
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:origin) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
  end

  context "scopes" do
    describe ".ordered_by_creation" do
      it "returns tweets in descending order of creation" do
        expect(Tweet.ordered_by_creation).to eq([ tweet2, tweet1 ])
      end
    end
  end
end
