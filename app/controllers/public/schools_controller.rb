class Public::SchoolsController < ApplicationController

  def likes_players
    @likes = Like.all
    likes = Like.where(school_id: current_school.id).pluck(:player_id)
    @likes_players = Player.find(likes)
  end

  def show
    @school = School.find(params[:id])
    @like_players = @school.likes

    if current_player

      @currentEntry = Entry.where(player_id: current_player.id)
      @schoolEntry = Entry.where(school_id: @school.id)
      @isRoom = false

        @currentEntry.each do |cu|
          @schoolEntry.each do |u|
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
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to school_path(current_school.id)
    else
      render :edit
    end
  end

  def unsubscribe_confirm
    render :unsubscribe
  end

  def unsubscribe
    @school = current_school
    @school.update(school_status: true) # 論理削除フラグを立てる
    reset_session # ログアウト処理
    flash[:notice] = '退会しました。'

    redirect_to :root
  end



  private

  def school_params
    params.require(:school).permit(:high_school_name, :manager_name, :spring_koshien_times, :summer_koshien_times, :address, :dormitory, :high_school_image, :high_school_pr)
  end


end
