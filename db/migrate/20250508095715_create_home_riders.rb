class CreateHomeRiders < ActiveRecord::Migration[8.0]
  def change
    create_table :home_riders do |t|
      t.string :home_rider_1
      t.string :home_rider_2
      t.string :home_rider_3
      t.string :home_rider_4
      t.string :home_rider_5
      t.string :home_rider_6
      t.string :home_rider_7

      t.timestamps
    end
  end
end
