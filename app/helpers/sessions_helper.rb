module SessionsHelper
	def create_game_session_id
		session[:game_id] =  ('a'..'z').to_a.shuffle[0..7].join
	end

	def create_players_hash(players_string)
		players_hash = Hash.new
		players = players_string.titleize.scan(/\w+[a-zA-Z]/).uniq
		players.each do |player|
			players_hash[player] = 0
		end
		session[:players_scores] = players_hash
	end
end
