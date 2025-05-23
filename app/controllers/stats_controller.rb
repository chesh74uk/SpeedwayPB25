class StatsController < ApplicationController

  def index
    find_meeting
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

end
