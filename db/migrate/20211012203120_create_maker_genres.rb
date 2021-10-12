class CreateMakerGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :maker_genres do |t|
      t.integer :maker_id, null:false
      t.integer :genre_id, null:false

      t.timestamps
    end
  end
end
