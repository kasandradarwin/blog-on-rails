class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

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
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
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
end
