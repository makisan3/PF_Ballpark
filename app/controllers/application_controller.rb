class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    case resource
    when Admin
      root_path
    when Player
      players_member_path(current_player.id)
    when School
      root_path
    end
  end
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when Player
      players_member_path(current_player.id)
    when School
      root_path
    end
  end
  


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :grade, :school, :enrollment, :base, :high_school_name, :manager_name, :koshien_times, :address, :domitory])
  end
end
