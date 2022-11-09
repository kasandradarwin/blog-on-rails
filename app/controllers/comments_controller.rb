class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
   before_action :authorize_user!, only: [:destroy]

  # POST /comments 
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    

    # respond_to do |format|
      if @comment.save
        redirect_to post_path(@post), notice: "Comment was successfully created." 
      else
        redirect_to post_path(@post.id), notice: "That didn't work-- make sure your comment is at least 50 Characters" 

      end
    end

  # DELETE /comments/1 
  def destroy
    @comment = Comment.find params[id]


    if can?(:crud, @comment)
      @comment.destroy
      redirect_to post_path(@post.comment)
      flash[:success] = "Answer deleted"
    else
      redirect_to root_path, alert: "Not Authorized to change answer!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body )
    end

    def authorize_user!
      redirect_to root_path, alert: "Not Authorized!" unless can?(:crud, @comment)
    end  
end
