class CommentsController < ApplicationController
  before_filter :set_user_and_post

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: user_post_path(@user, @post) }
      else
        format.html { render 'posts/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_and_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :name, :email, :comment)
    end
end
