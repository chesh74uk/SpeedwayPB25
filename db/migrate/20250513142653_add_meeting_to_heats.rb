class AddMeetingToHeats < ActiveRecord::Migration[8.0]
  def change
    add_reference :heats, :meeting, null: false, foreign_key: true
  end
end
