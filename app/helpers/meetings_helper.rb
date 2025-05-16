module MeetingsHelper
    def home_score(meeting)
      if meeting.nil? || meeting.heats.nil?
        0
      else
        score = meeting.heats.sum(:blue_score) + meeting.heats.sum(:red_score)
      end
    end

    def away_score(meeting)
      if meeting.nil? || meeting.heats.nil?
        0
      else
        score = meeting.heats.sum(:white_score) + meeting.heats.sum(:yellow_score)
      end
    end
  end

