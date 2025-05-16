class HeatsController < ApplicationController
  before_action :find_meeting, only: %i[new create]
  def new
      @heat = @meeting.heats.where(params[:id])
      @home_riders = @meeting.home_rider
      @away_riders = @meeting.away_rider
      @heat = Heat.new
      @heat.build_meeting
      heat_number_set
  end

  def create
    @meeting.heats << Heat.new(heat_params)
    if @meeting.save
      redirect_to new_meeting_heat_path(@meeting)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def heat_number_set
    last_heat = @meeting.heats
    if last_heat.nil?
      heat_number = 1
    else
      heat_number = last_heat.count + 1
    end
    @heat.heat_number = heat_number
  end

  def heat_params
    params.expect(heat: [:heat_number, :heat_time,
                         :red_gate, :red_score, :red_rider,
                         :blue_gate, :blue_score, :blue_rider,
                         :white_gate, :white_score, :white_rider,
                         :yellow_gate, :yellow_score, :yellow_rider])
  end

end
