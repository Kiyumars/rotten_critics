class Player < ActiveRecord::Base
	belongs_to :game
	VALID_PLAYER_NAME = /\A[a-zA-Z]+\z/
	validates :name, presence: true, length: { maximum: 20 },
									 format: { with: VALID_PLAYER_NAME}, allow_blank: false
	def self.update_score(guess, correct_score)
		penalty_points = (guess - correct_score).abs
	end
end