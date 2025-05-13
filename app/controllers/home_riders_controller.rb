class HomeRidersController < ApplicationController
  before_action :find_meeting, only: %i[new create edit update]
  def new
    @home_rider = HomeRider.new
    @home_rider.build_meeting
  end

  def create
    @meeting.home_rider = HomeRider.new(home_rider_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @home_rider = @meeting.home_rider
  end

  def update
    if @meeting.home_rider.update(home_rider_params)
      redirect_to meetings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def home_rider_params
    params.expect(home_rider: [:home_rider_1, :home_rider_2, :home_rider_3,
                                       :home_rider_4, :home_rider_5, :home_rider_6, :home_rider_7])
  end

end
