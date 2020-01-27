class MonitoringController < ApplicationController
  FLURBO_BALANCE_ENDPOINT = 'flurbos#show'

  def balance_check_count
    tracker_events =
      User.find(params[:user_id]).tracker_events
        .where(endpoint: FLURBO_BALANCE_ENDPOINT)
        .where('created_at >= ?', 1.week.ago)

    render 200, json: tracker_events.count
  end
end
