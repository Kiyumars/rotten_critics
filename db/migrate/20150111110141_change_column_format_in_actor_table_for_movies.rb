class ChangeColumnFormatInActorTableForMovies < ActiveRecord::Migration
  def up
    change_column :actors, :movies, :text
  end

  def down
    change_column :actors, :movies, :string
  end
end
