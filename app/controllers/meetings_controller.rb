class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy]
  def index
    @meetings = Meeting.all.order(date: :desc)
  end

  def new
    @meeting = Meeting.new
    @team_names = Team.select(:team_name).order(:team_name).distinct
  end

  def edit
    @team_names = Team.select(:team_name).order(:team_name).distinct
  end

  def create
    @meeting = Meeting.new(meeting_params)
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meetings_path notice: "Meeting was successfully created" }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        redirect_to meetings_path, notice: "Meeting was successfully updated"
      else
        render :edit
      end
    end
  end
  def show
  end

  def destroy
    @meeting.destroy
    respond_to do |format|
      redirect_to meetings_url, notice: "Meeting was successfully removed"
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
  def meeting_params
    params.expect(meeting: [ :date, :home_team, :away_team, :gate_choice,
                             home_riders_attributes:
      [:home_rider_1, :home_rider_2, :home_rider_3, :home_rider_4, :home_rider_5, :home_rider_6, :home_rider_7],
                             away_riders_attributes:
       [:away_rider_1, :away_rider_2, :away_rider_3, :away_rider_4, :away_rider_5, :away_rider_6, :away_rider_7]])
  end
end
