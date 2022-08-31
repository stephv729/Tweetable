class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @tweet = Tweet.find(params[:id])
    @comment.tweet= @tweet
    @comment.body = params[:body]
    
    if @comment.save
      redirect_to tweet_path(id:params[:id])
    else
      render "tweets/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @tweet = @comment.tweet
    @comment.destroy
    redirect_to @tweet, status: :see_other
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @tweet = @comment.tweet
    if @comment.update(body:params[:comment][:body])
      redirect_to  @tweet
    else
      render "edit", status: :unprocessable_entity
    end
  end
end
