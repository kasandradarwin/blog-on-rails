# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:destroy]

  # POST /comments
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      flash[:success]="Comment added"
    else
      @comments = @post.comments.order(created_at: :desc)
      flash[:alert] = @comment.errors.full_messages.join(", ")

    end
    redirect_to @post
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])

    if can?(:crud, @comment)
      @comment.destroy
      redirect_to post_path(@post.comment)
      flash[:success] = 'Answer deleted'
    else
      redirect_to root_path, alert: 'Not Authorized to change answer!'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user!
    redirect_to root_path, alert: 'Not Authorized!' unless can?(:crud, @comment)
  end
end
