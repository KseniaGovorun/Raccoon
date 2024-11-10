class TweetsController < ApplicationController
  before_action :authenticate_user!

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

  def error
    render "error"
  end

  def retweet
    @tweet = resource
    @retweet = current_user.tweets.build(origin_id: @tweet.id)

    if @retweet.save
      redirect_to tweets_path, notice: "The retweet has created successfully"
    else
      redirect_to tweets_path, alert: "The retweet was not created"
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
