class Public::Players::LikesController < ApplicationController

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

