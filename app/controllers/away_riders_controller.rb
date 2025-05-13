class AwayRidersController < ApplicationController
    before_action :find_meeting, only: %i[new create edit update]
    def new
      @away_rider = AwayRider.new
      @away_rider.build_meeting
    end

    def create
      @meeting.away_rider = AwayRider.new(away_rider_params)
      if @meeting.save
        redirect_to meetings_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @away_rider = @meeting.away_rider
    end

    def update
      if @meeting.away_rider.update(away_rider_params)
        redirect_to meetings_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private
    def find_meeting
      @meeting = Meeting.find(params[:meeting_id])
    end

    def away_rider_params
      params.expect(away_rider: [:away_rider_1, :away_rider_2, :away_rider_3,
                                 :away_rider_4, :away_rider_5, :away_rider_6, :away_rider_7])
    end

  end
