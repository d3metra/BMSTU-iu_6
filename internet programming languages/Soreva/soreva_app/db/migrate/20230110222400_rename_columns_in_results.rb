class RenameColumnsInResults < ActiveRecord::Migration[7.0]
  def change
    rename_column :results, :pull_ups_bars, :push_ups_bars
    rename_column :results, :pull_ups_bars_max, :push_ups_bars_max
  end
end
