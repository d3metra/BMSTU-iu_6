class AddIndexToInput < ActiveRecord::Migration[7.0]
  def change
    add_index :results, :input, unique: true
  end
end
