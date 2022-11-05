class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # # GET /comments or /comments.json
  # def index

  #   @comments = Comment.all
  #   @post = Post.find(params[:post_id])

  # end

  # # GET /comments/1 or /comments/1.json
  # def show
  #   @post = Post.find(params[:post_id])
  # end

  # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end


  # POST /comments or /comments.json
  def create
    # byebug
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    # @comment = @post.comments.create(params[:comment]).permit(:name, :comment)
    

    # respond_to do |format|
      if @comment.save
        redirect_to post_path(@post), notice: "Comment was successfully created." 
      else
        # byebug
        # render :new, status: :unprocessable_entity 
        redirect_to post_path(@post.id), notice: "That didn't work-- make sure your comment is at least 50 Characters" 

      end
    end
  # end

  # PATCH/PUT /comments/1 
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1 or /comments/1.json
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
