class Player < ActiveRecord::Base
	VALID_PLAYER_NAME = /\A[a-zA-Z]+\z/
	validates :name, presence: true, length: { maximum: 20 }, format: { with: VALID_PLAYER_NAME}
end