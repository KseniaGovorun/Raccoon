require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  let(:user) { create(:user) }
  let!(:tweet) { create(:tweet, user:) }
  before { sign_in user }

  context "GET /tweets" do
    it "should render index page" do
      get tweets_path
      expect(response).to render_template :index
    end
  end

  context "GET /tweets/new" do
    it "should render new page" do
      get new_tweet_path
      expect(response).to render_template :new
    end
  end

  context "GET /tweets/edit" do
    it "should render edit page" do
      get edit_tweet_path(tweet)
      expect(response).to render_template :edit
    end
  end

  context "POST /tweets" do
    it "should create a tweet with valid attributes" do
      post tweets_path, params: { tweet: FactoryBot.attributes_for(:tweet) }
      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq 'Tweet has created successfully'
    end
  end

  context "PUT /tweets" do
    it "should update a tweet with valid attributes" do
      put "/tweets/#{tweet.id}", params: { tweet: FactoryBot.attributes_for(:tweet) }
      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq 'Tweet has updated successfully'
    end
  end

  context "DELETE /tweets" do
    it "should destroy a tweet" do
      delete "/tweets/#{tweet.id}"
      expect(response).to redirect_to tweets_path
      expect(flash[:notice]).to eq 'Tweet has deleted successfully'
    end
  end
end
