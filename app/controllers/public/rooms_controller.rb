class Public::RoomsController < ApplicationController
  

  def index

  end

  def create
    @room = Room.create
    @entry = Entry.create(params.require(:entry).permit(:player_id, :room_id).merge({room_id: @room.id, school_id: current_school.id}))
    redirect_to "/rooms/#{@room.id}"
    #メッセージがschollによるものだったらis_school=true,playerによるものだったらis_school=false
    if school_signed_in?
      @message.is_school = true
    elsif player_signed_in?
      @message.is_school = false
    end
  end

  def show
   
    #if school_signed_in? && Entry.where(school_id: current_school.id,room_id: @room.id).present?
      #@messages = @room.messages
      #@message = Message.new
      #@entries = @room.entries
      #@entry_all = Entry.all
   # elsif Entry.where(player_id: current_player.id,room_id: @room.id).present?
    if school_signed_in? || player_signed_in?
      @room = Room.find(params[:id])
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
      @entry_all = Entry.all
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
