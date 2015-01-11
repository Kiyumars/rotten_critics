class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :tmdb_id
      t.string :imdb_id
      t.string :title
      t.text :overview
      t.date :release_date
      t.string :tagline
      t.string :poster_path
      t.integer :critics_score
      t.integer :audience_score
      t.string :cast
      t.string :directors
      t.string :screenwriters
      t.string :trailer

      t.timestamps
    end
  end
end
