class GameRoundsController < ApplicationController
	def new
	end

	def create
		game_id =  ('a'..'z').to_a.shuffle[0..7].join
		players = params[:players].split(",").map(&:strip)
		players.each do |player|
			new_player = Player.new(name: player, game_id: game_id, score: 0)
			if new_player.save
				next
			else
				redirect_to'new'
			end
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
