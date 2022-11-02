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

  # GET /comments/1/edit
  # def edit
  #   @post = Post.find(params[:post_id])
  # end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    # @comment = @post.comments.create(params[:comment]).permit(:name, :comment)
    

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comment_path(@comment, @post), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
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
      params.require(:comment).permit(:body)
    end
end
