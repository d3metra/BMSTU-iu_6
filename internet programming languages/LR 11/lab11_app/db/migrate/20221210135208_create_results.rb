class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :input, array: true, null: false
      t.string :iterations, array: true, null: false
      t.integer :gcd, null: false
      t.integer :lcm, null: false

      t.timestamps
    end
  end
end
