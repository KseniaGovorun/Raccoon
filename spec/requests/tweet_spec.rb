require 'rails_helper'

RSpec.describe TweetsController, type: :request do
  let(:user) { create(:user) }
  let!(:tweet) { create(:tweet, user:) }
  let(:valid_attributes) { FactoryBot.attributes_for(:tweet) }

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
      expect(flash[:notice]).to eq 'Tweet has created successfully'
    end
  end

  context "PUT /tweets" do
    it "updates a tweet with valid parameters" do
      put tweet_path(tweet), params: { tweet: valid_attributes }

      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq 'Tweet has updated successfully'
    end
  end

  context "DELETE /tweets" do
    it "deletes the tweet and redirect to tweets path" do
      delete tweet_path(tweet)

      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq 'Tweet has deleted successfully'
    end
  end
end
