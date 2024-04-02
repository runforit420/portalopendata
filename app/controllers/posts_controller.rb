class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new # Initialize a new comment
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
  @post = Post.new(post_params)

  respond_to do |format|
    if @post.save
      format.html { redirect_to @post, notice: 'Post was successfully created.' }
      format.json { render :show, status: :created, location: @post }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: { post: @post }) }
    else
      format.html { render :new, status: :unprocessable_entity, locals: { errors: @post.errors.full_messages } }
      format.json { render json: @post.errors, status: :unprocessable_entity }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/form", locals: { post: @post, errors: @post.errors.full_messages }) }
    end
  end
end
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: 'Failed to create comment.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
# Removed commented out styles method
end
