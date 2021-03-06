class Public::LikesController < ApplicationController

  def like
    @likes = Like.where(school_id: params[:school_id])
    @like = Like.new
  end

  def create
    @like = current_school.likes.create(player_id: params[:player_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(player_id: params[:player_id], school_id: current_school.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end

