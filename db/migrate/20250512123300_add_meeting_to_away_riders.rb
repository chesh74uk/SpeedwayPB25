class AddMeetingToAwayRiders < ActiveRecord::Migration[8.0]
  def change
    add_reference :away_riders, :meeting, null: false, foreign_key: true
  end
end
