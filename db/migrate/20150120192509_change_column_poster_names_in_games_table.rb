class ChangeColumnPosterNamesInGamesTable < ActiveRecord::Migration
  def up
    rename_column :movies, :poster_path, :poster
  end

  def down
    rename_column :movies, :poster, :poster_path
  end
end
