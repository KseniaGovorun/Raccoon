class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet=Tweet.find(params[:id])
  end

  def new
    @tweet=Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet=Tweet.find(params[:id])
  end

  def update
    @tweet=Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    end
  end

  def destroy
    @tweet=Tweet.find(params[:id])
    @tweet.destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
