class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Posts.all 
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format| 
      if @post.save
        format.html { redirect_to @post, notice:'Post was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end 

  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @Post, notice: 'Post was successfully updated.'}
      else
        format.html { render :edit}
      end
    end
  end 

  def destroy
    @post.destroy
  respond_to do |format|
    format.html {redirect_to posts_url, notice: 'Post was successfully destroyed.'}
  end

  end

def set_post
    @post = Post.find(params[:id])
end 

def post_params
  params.require(:post).permit(:title, :content, :user_id)

end



end
