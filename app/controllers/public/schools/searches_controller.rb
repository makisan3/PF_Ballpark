class Public::Schools::SearchesController < ApplicationController
  def search
  end

  def result
    #Viewのformで取得したパラメータをモデルに渡す
    @players = Player.search(params)
    if @players.blank?
      flash[:alert] = "該当者いません"
      render :search
      return
    end
    @like = Like.new
  end

  def like
    @likes = Like.all
  end

  def create
    @like = current_school.likes.create(player_id: params[:player_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(player_id: params[:id], school_id: current_school.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
