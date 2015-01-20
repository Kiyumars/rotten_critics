class ChangeColumnFormatInGamesTableForMovies < ActiveRecord::Migration
 def up
    change_column :games, :movies, :text
  end

  def down
    change_column :games, :movies, :string
  end
end
