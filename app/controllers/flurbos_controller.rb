class FlurbosController < ApplicationController

  def show
    @flurbo = Flurbo.find_by_user_id(params[:user_id])
    if @flurbo
      TrackerEvent.create(user_id: params[:user_id], endpoint: "#{controller_name}##{action_name}")
      render 200, json: { balance: @flurbo.balance }
    end
  end
end
