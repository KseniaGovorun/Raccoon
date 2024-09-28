class TweetsController < ApplicationController
  def index
  end

  def show
    @tweet=Tweet.find(params[:id])
  end

  def create
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(body:, user_id:, created_at:)
  end
end
