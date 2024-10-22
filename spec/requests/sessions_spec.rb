require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let!(:user) { create(:user) }

  describe "after_sign_in_path_for" do
    it "returns the tweets path" do
      expect(controller.after_sign_in_path_for(user)).to eq(tweets_path)
    end
  end
end