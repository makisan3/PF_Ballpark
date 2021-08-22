class Admin::SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(team_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to admin_schools_path
    else
      render :edit
    end
  end



  private

  def team_params
    params.require(:school).permit(:high_school_name, :manager_name, :address, :email, :spring_koshien_times, :summer_koshien_times, :dormitory, :school_status)
  end


end
