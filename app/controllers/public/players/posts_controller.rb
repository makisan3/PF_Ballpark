class Public::Players::PostsController < ApplicationController
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
    #@post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.player_id = current_player.id
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
