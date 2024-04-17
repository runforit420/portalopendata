# app/controllers/posts_controller.rb
require 'cancancan'
class PostsController < ApplicationController
  #include CanCanCan::ControllerHelpers
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end
def create
  if current_user
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity, locals: { errors: @post.errors.full_messages } }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  else
    # Tratează cazul în care utilizatorul nu este autentificat
    # Poți redirecționa către pagina de autentificare sau afișa un mesaj de eroare
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
  @post = current_user.posts.find(params[:id]) # Assuming Devise for user authentication
  @post.destroy
  redirect_to posts_path, notice: 'Post was successfully deleted.' # Or another path
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
end

