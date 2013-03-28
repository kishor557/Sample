class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.string :name
      t.integer :left
      t.integer :top
      t.timestamps
    end
  end
end
