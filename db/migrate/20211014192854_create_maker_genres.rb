class CreateMakerGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :maker_genres do |t|
      t.references :maker, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
