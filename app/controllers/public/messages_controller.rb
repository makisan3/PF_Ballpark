class Public::MessagesController < ApplicationController

  def create
    @message = Message.new(params.require(:message).permit(:player_id, :content, :room_id).merge(school_id: current_school.id))
    if Entry.where(school_id: current_school.id, room_id: params[:message][:room_id]).present?
      @message.save
      redirect_to "/rooms/#{@message.room_id}"
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_to "/rooms/#{@message.room_id}"
    end
  end

end
