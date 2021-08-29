class Public::PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
    @posts = @player.posts
    @like = Like.new

    if current_school

      @currentEntry = Entry.where(school_id: current_school.id)
      @playerEntry = Entry.where(player_id: @player.id)
      @isRoom = false

        @currentEntry.each do |cu|
          @playerEntry.each do |u|
            if cu.room_id == u.room_id then

              @isRoom = true
              @roomId = cu.room_id

            end
          end
        end

        if !@isRoom
          @room = Room.new
          @entry = Entry.new
        end
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to player_path(current_player.id)
    else
      render :edit
    end
  end

  def unsubscribe_check
    render :unsubscribe
  end

  def unsubscribe
    @player = current_player
    @player.update(player_status: true) # 論理削除フラグを立てる
    reset_session # ログアウト処理
    flash[:notice] = '退会しました。'

    redirect_to :root
  end




  private

  def player_params
    params.require(:player).permit(:name, :school, :enrollment, :grade, :base, :player_image, :player_pr)
  end

end
