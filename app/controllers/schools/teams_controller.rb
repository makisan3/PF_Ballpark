class Schools::TeamsController < ApplicationController
  def show
    @school = School.find(params[:id])
    @like_players = Like.all
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(team_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to schools_team_path(current_school.id)
    else
      render :edit
    end
  end

  def unsubscribe_confirm
    render :unsubscribe
  end

  def unsubscribe
    @school = School.find(params[:id])
    @school.update(school_status: true) # 論理削除フラグを立てる
    reset_session # ログアウト処理
    flash[:notice] = '退会しました。'

    redirect_to :root
  end



  private

  def team_params
    params.require(:school).permit(:high_school_name, :manager_name, :spring_koshien_times, :summer_koshien_times, :address, :dormitory, :high_school_image, :high_school_pr)
  end


end
