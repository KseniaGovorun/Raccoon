require 'rails_helper'

RSpec.describe PublicTweetsController, type: :request do
  context "GET /public_tweets" do
    it "returns a successful response" do
      get public_tweets_path


      expect(response).to be_successful
    end
  end
end
