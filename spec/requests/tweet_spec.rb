require 'rails_helper'

RSpec.describe TweetsController, type: :request do
  let(:user) { create(:user) }
  let!(:tweet) { create(:tweet, user:) }
  let!(:retweet) { create(:tweet, user: user, origin_id: tweet.id) }
  let(:valid_attributes) { attributes_for(:tweet) }

  before { sign_in user }

  context "GET /tweets" do
    it "returns a successful response" do
      get tweets_path

      expect(response).to be_successful
    end
  end

  context "GET /tweets/:id" do
    it "returns a successful response for a valid tweet" do
      get tweet_path(tweet)

      expect(response).to be_successful
    end
  end

  context "GET /tweets/new" do
    it "returns a successful response" do
      get new_tweet_path

      expect(response).to have_http_status(:success)
    end
  end

  context "GET /tweets/:id/edit" do
    it "returns a successful response" do
      get edit_tweet_path(tweet)

      expect(response).to have_http_status(:success)
    end
  end

  context "POST /tweets" do
    it "creates a new tweet with and redirect to tweets path" do
      post tweets_path, params: { tweet: valid_attributes }

      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq "Tweet has created successfully"
    end
  end

  context "POST /tweets/:id/retweet" do
    it "creates a new retweet and redirects to tweets path" do
      expect { post retweet_tweet_path(tweet) }.to change { Tweet.where(origin_id: tweet.id).count }.by(1)
      expect(response).to redirect_to(tweets_path)
    end
  end

  context "PUT /tweets" do
    it "updates a tweet with valid parameters" do
      put tweet_path(tweet), params: { tweet: { body: "I'm from Factory Bot2.0" } }

      expect(response).to redirect_to tweets_path
      expect(tweet.reload.body). to eq("I'm from Factory Bot2.0")
      expect(flash[:notice]).to eq "Tweet has updated successfully"
    end
  end

  context "DELETE /tweets" do
    it "deletes the tweet and redirect to tweets path" do
      expect { delete tweet_path(tweet) }.to change(Tweet, :count).by(-2)
    end

    it "redirects to the tweets path" do
      delete tweet_path(tweet)

      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq "Tweet has deleted successfully"
    end
  end
end
