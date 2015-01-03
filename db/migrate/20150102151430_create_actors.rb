class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :tmdb_id
      t.string :imdb_id
      t.text :bio
      t.string :movies
      t.date :birthday

      t.timestamps
    end
  end
end
