class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_rooms

  def after_sign_up_path_for(resource)
    case resource
    when Admin
      root_path
    when Player
      players_member_path(current_player.id)
    when School
      schools_team_path(current_school.id)
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_players_path
    when Player
      player_path(resource)
    when School
      school_path(resource)
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :grade, :school, :enrollment, :base, :high_school_name, :manager_name, :spring_koshien_times, :summer_koshien_times, :address, :dormitory])
  end

  def set_rooms
    @entry_all = nil
    if school_signed_in?
      @entry_all = Entry.where(school_id: current_school.id)
    elsif player_signed_in?
      @entry_all = Entry.where(player_id: current_player.id)
    end
  end
end
