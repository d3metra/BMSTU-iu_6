class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.float :bench_press_max
      t.integer :bench_press
      t.float :pull_ups_max
      t.integer :pull_ups
      t.float :pull_ups_bars_max
      t.integer :pull_ups_bars
      t.float :run_100m
      t.string :run_3000m

      t.timestamps
    end
  end
end
