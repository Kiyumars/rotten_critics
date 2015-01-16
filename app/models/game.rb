class Game < ActiveRecord::Base
	has_many :players
	serialize :movies, Array
  # validates :movies, presence: true
  validates :game_id, presence: true
end
