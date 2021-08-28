class Public::MessagesController < ApplicationController

  def create
    user_valid = nil
    if school_signed_in?
      @message = Message.new(params.require(:message).permit(:player_id, :content, :room_id).merge(school_id: current_school.id))
      user_valid = Entry.where(school_id: current_school.id, room_id: params[:message][:room_id]).present?
    else
      @message = Message.new(params.require(:message).permit(:school_id, :content, :room_id).merge(player_id: current_player.id))
      user_valid = Entry.where(player_id: current_player.id, room_id: params[:message][:room_id]).present?
    end
    if user_valid
      @message.save
      redirect_to "/rooms/#{@message.room_id}"
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_to "/rooms/#{@message.room_id}"
    end
    #メッセージがschollによるものだったらis_school=true,playerによるものだったらis_school=false
    #if school_signed_in?
      #@message.is_school = true
    #elsif player_signed_in?
      #@message.is_school = false
    #end
  end

end
