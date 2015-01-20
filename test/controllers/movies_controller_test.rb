require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
	def setup
		@first_game = games(:first_game)
		@existing_actor = actors(:Pacino)
	end

end
