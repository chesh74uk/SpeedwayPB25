class CreateAwayRiders < ActiveRecord::Migration[8.0]
  def change
    create_table :away_riders do |t|
      t.string :away_rider_1
      t.string :away_rider_2
      t.string :away_rider_3
      t.string :away_rider_4
      t.string :away_rider_5
      t.string :away_rider_6
      t.string :away_rider_7

      t.timestamps
    end
  end
end
