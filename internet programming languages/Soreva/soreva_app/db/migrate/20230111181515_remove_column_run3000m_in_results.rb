class RemoveColumnRun3000mInResults < ActiveRecord::Migration[7.0]
  def change
    remove_column :results, :run_3000m
    add_column :results, :barbell_squat, :integer
  end
end
