class GameRoundsController < ApplicationController
	def new
	end

	def create
		game_id =  ('a'..'z').to_a.shuffle[0..7].join
		players = params[:players].titleize.scan(/\w+[a-zA-Z]/).uniq

		if players.blank?
			redirect_to new_game_path
			return
		end

		players.each do |player|
			new_player = Player.new(name: player, game_id: game_id, score: 0)
			new_player.save
		end
		redirect_to allplayers_path
	end

	def destroy
	end

	def update

	end

	def show
		@players = Player.all
	end
end
