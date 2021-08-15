class Players::MembersController < ApplicationController
  def show
    @member = current_player
    #@member = Member.find(params[:id])
    #@posts = @player.posts.page(params[:page]).reverse_order
  end


end
