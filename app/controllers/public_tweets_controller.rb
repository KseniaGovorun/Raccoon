class PublicTweetsController < ApplicationController
  def index
    @tweets = collection
  end

  def show
    @tweet = resource
  end

  private

  def collection
    Tweet.ordered_by_creation
  end

  def resource
    collection.find(params[:id])
  end
end
