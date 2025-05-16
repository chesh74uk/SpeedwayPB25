class CreateHeats < ActiveRecord::Migration[8.0]
  def change
    create_table :heats do |t|
      t.integer :heat_number
      t.string :heat_time
      t.integer :red_gate
      t.integer :red_score
      t.string :red_rider
      t.integer :blue_gate
      t.integer :blue_score
      t.string :blue_rider
      t.integer :white_gate
      t.integer :white_score
      t.string :white_rider
      t.integer :yellow_gate
      t.integer :yellow_score
      t.string :yellow_rider

      t.timestamps
    end
  end
end
