class PostsController < ApplicationController
  before_action :set_user, except: :new
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = @post.comments.new

    redirect_to user_path(@post.user) unless @post.scheduled_to < Time.zone.now || (user_signed_in? && @post.user == current_user)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@post.user, @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: user_post_path(@post.user, @post) }
      else
        format.html { render 'posts/new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_post_path(@post.user, @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: user_post_path(@post.user, @post) }
      else
        format.html { render 'posts/edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end
    def set_post
      @post = @user.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :post, :scheduled_to)
    end
end
