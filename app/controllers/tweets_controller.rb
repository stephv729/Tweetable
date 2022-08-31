class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.new
    @tweet.user_id = current_user.id
    @tweet.body = params[:tweet][:body]
    if @tweet.save
      redirect_to tweets_path
    else
      render "index", status: :unprocessable_entity
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end 

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(body:params[:tweet][:body])
      redirect_to  tweets_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path, status: :see_other
  end
end
