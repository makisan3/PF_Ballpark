class Public::RoomsController < ApplicationController
  

  def index

  end

  def create
    @room = Room.create
    @entry = Entry.create(params.require(:entry).permit(:player_id, :room_id).merge({room_id: @room.id, school_id: current_school.id}))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
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
