class ChangeColumnNamesInGamesTableToSingular < ActiveRecord::Migration
  def up
    rename_column :movies, :directors, :director
    rename_column :movies, :screenwriters, :screenwriter
  end

  def down
    rename_column :movies, :director, :directors
    rename_column :movies, :screenwriters, :screenwriters
  end
end
