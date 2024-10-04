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
      flash[:notice] = "Tweet has created successfully"
      redirect_to tweets_path
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
      flash[:notice] = "Tweet has updated successfully"
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = resource
    @tweet.destroy
  end

  private

  def collection
    Tweet.all
  end

  def resource
    collection.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
