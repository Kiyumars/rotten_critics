class Movie < ActiveRecord::Base
	validate :title, presence: true
	validate :overview, presence:true
	validate :critics_score, presence:true

	def pick_one_movie(random_movie_id)
		# Movie.find_by(:tmdb_id => random_movie_id)
	end
end
