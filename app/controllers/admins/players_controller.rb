class Admins::PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(member_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to admins_players_path
    else
      render :edit
    end
  end



  private

  def member_params
    params.require(:player).permit(:name, :school, :enrollment, :grade, :base, :player_status)
  end


end
