class Schools::SearchesController < ApplicationController
  def search
  end

  def result

    #Viewのformで取得したパラメータをモデルに渡す
    @players = Player.search(params)
    if @players.blank?
      flash[:alert] = "該当者いません"
      render :search
      return
    end
  end

end
