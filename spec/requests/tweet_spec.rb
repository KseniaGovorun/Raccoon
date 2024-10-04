require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET /index" do
    it 'assigns @tweets' do
      tweet = Tweet.create
      get :index
      expect(assigns(:tweet)).to eq([ tweet ])
    end
  end
end
