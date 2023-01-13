class AddForeignKeyToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :user
  end
end
