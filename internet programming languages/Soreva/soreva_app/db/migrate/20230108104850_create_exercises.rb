class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :description, null: false
      t.string :technique, null: false

      t.timestamps
    end
  end
end
