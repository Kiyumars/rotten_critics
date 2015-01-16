class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_id
      t.string :movies

      t.timestamps
    end
  end
end
