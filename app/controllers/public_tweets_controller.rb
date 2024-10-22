class PublicTweetsController < ApplicationController
  def index
    @tweets = collection
  end

  private

  def collection
    Tweet.ordered_by_creation
  end
end
