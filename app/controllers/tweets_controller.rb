class TweetsController < ApplicationController
  def index
    @tweets = collection
  end

  def show
    @tweet = resource
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)


    if @tweet.save
      redirect_to tweets_path, notice: "Tweet has created successfully"
    else
      render :new
    end
  end

  def edit
    @tweet = resource
  end

  def update
    @tweet = resource

    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet has updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @tweet = resource

    if @tweet.destroy
      redirect_to tweets_path, notice: "Tweet has deleted successfully"
    else
      render :index
    end
  end

  private

  def collection
    Tweet.ordered_by_creation
  end

  def resource
    collection.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
