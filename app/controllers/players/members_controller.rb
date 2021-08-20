class Players::MembersController < ApplicationController
  def show
    @player = Player.find(params[:id])
    @posts = Post.all
    @like = Like.new
    #@post = Post.find(params[:id])
    #@posts = @player.posts.page(params[:page]).reverse_order
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(member_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to players_member_path(current_player.id)
    else
      render :edit
    end
  end

  def unsubscribe_check
    render :unsubscribe
  end

  def unsubscribe
    @player = Player.find(params[:id])
    @player.update(player_status: true) # 論理削除フラグを立てる
    reset_session # ログアウト処理
    flash[:notice] = '退会しました。'
    
    redirect_to :root
  end




  private

  def member_params
    params.require(:player).permit(:name, :school, :enrollment, :grade, :base, :player_image, :player_pr)
  end

end
