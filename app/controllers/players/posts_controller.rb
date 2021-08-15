class Players::PostsController < ApplicationController
  def new
     @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.player_id = current_player.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end