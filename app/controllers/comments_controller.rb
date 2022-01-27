class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:current_user_id]
    @comment.article_id = params[:id]
    if @comment.save
      redirect_to show_comments_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.user_id == session[:current_user_id]
      @comment.destroy
      redirect_to show_comments_path
    else
      redirect_to show_comments_path
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
