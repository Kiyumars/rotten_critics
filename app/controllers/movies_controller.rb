class MoviesController < ApplicationController

	def create
		# find_and_store_tmdb_movie_info(params[:tmdb_id])
	end

  def edit
    @game_session = Game.find(params[:game_id])
    @movie = Movie.find_by(:tmdb_id => params[:id])
    @players = @game_session.players
  end

  def update
  end

	# def find_and_store_tmdb_movie_info(tmdb_id)
 #    actor_filmography = Actor.find_by(tmdb_id).movies
 #    actor_filmography.each do |movie_id|
 #      movie = prepare_movie_hash(movie_id)
 #      if !movie.nil?
 #        Movie.create(:imdb_id => movie["imdb_id"].to_s,
 #                      :tmdb_id => movie["id"].to_s,
 #                      :overview => movie["overview"],
 #                      :tagline => movie["tagline"],
 #                      :title => movie["title"],
 #                      :poster_path => movie["poster_path"],
 #                      :critics_score => movie["critics_score"],
 #                      :audience_score => movie["audience_score"],
 #                      :cast => movie["cast"],
 #                      :directors => movie["directors"],
 #                      :screenwriters => movie["screenwriters"],
 #                      :trailer => movie["trailer"],
 #                      :release_date => movie["release_date"])
 #      end
 #    end
 #  end
end

# def request_tmdb_json(request_type_url, extra_url='')
#   request_url = "http://api.themoviedb.org/3/"
#   request_url += request_type_url
#   request_url += "?api_key="
#   request_url += ENV['tmdb_key']
#   request_url += extra_url

#   resp = Net::HTTP.get_response(URI(request_url))
#   return JSON(resp.body)
# end

# def get_basic_movie_info(movie_hash, movie_id)
#   basic_movie_keys = ['id', "imdb_id", 'title', 'overview', 'release_date',
#              'tagline']
#   basic_info = request_tmdb_json("movie/" + movie_id.to_s)

#   basic_movie_keys.each do |basic_key|
#     movie_hash[basic_key] = basic_info[basic_key]
#   end
#   if basic_info['poster_path'] != nil
#     movie_hash['poster_path'] = "http://image.tmdb.org/t/p/w500" + basic_info['poster_path']
#   end
# end


# def get_five_topbilled_actors(casts_request, movie_hash)
#   cast_list = Array.new
#   casts_request['cast'].each do |actor|
#     if actor['order'] < 5 then
#       cast_list.push(actor['name'])
#     end
#   end
#   movie_hash['cast'] = cast_list.join(", ")
# end


# def determine_and_push_to_directors_or_screenwriters(crew, directors, screenwriters)
#   if crew['job'] == "Director" then
#     directors.push(crew['name'])
#   elsif crew['job'] == "Screenplay" then
#     screenwriters.push(crew['name'])
#   end
# end


# def get_directors_and_screenwriters(casts_request, movie_hash)
#   directors = Array.new
#   screenwriters = Array.new
#   casts_request['crew'].each do |crew|
#     determine_and_push_to_directors_or_screenwriters(crew, directors, screenwriters)
#   end

#   if directors.length > 0 then
#     movie_hash['directors'] = directors.join(", ")
#   end

#   if screenwriters.length > 0 then
#     movie_hash['screenwriters'] = screenwriters. join(", ")
#   end
# end


# def get_casts_info(movie_hash, movie_id)
#   casts_request = request_tmdb_json("movie/" + movie_id.to_s + "/casts")

#   get_five_topbilled_actors(casts_request, movie_hash)
#   get_directors_and_screenwriters(casts_request, movie_hash)
# end


# def add_trailer_or_featurette_to_moviehash(videos_json, movie_hash)
#   videos_json['results'].each do |video|
#     if video['type'] == "Trailer" then
#       movie_hash['trailer'] = "https://www.youtube.com/watch?v=" + video['key']
#     elsif video['type'] == "Featurette" then
#       movie_hash['featurette'] = "https://www.youtube.com/watch?v=" + video['key']
#     end
#   end
# end


# def get_videos(movie_hash, movie_id)
#   videos_json = request_tmdb_json("movie/" + movie_id.to_s + "/videos")
#   if videos_json['results'].length > 0 then
#     add_trailer_or_featurette_to_moviehash(videos_json, movie_hash)
#   end
# end


# def prepare_movie_hash(movie_id)
#   movie_hash = Hash.new
#   get_basic_movie_info(movie_hash, movie_id)
#   enough_movie_reviews = add_rt_info(movie_hash['imdb_id'][2..-1], movie_hash)
#   if ! enough_movie_reviews then
#     return nil
#   end
#   critics_score, audience_score = enough_movie_reviews
#   movie_hash['critics_score'] = critics_score
#   movie_hash['audience_score'] = audience_score
#   get_casts_info(movie_hash, movie_id)
#   get_videos(movie_hash, movie_id)

#   return movie_hash
# end

# def get_json_from_rt_movie_alias(imdb_movie_id)
#   begin
#     request_url = "http://api.rottentomatoes.com/api/public/v1.0/"
#     request_url += "movie_alias.json?apikey=" + ENV['rt_key']
#     request_url += "&type=imdb&id=" + imdb_movie_id

#     resp = Net::HTTP.get_response(URI(request_url))
#     return JSON(resp.body)
#   rescue TypeError
#     puts "No imdb id"
#     return false
#   end
# end


# def check_if_rt_scores_exist_and_return(imdb_movie_id)
#   begin
#     rt_json = get_json_from_rt_movie_alias(imdb_movie_id)
#     critics_score = rt_json['ratings']['critics_score']
#   rescue NoMethodError
#     puts "No method error"
#     puts imdb_movie_id
#     return false
#   end
#   if critics_score < 0 or critics_score.nil? then
#     puts "No reviews"
#     puts imdb_movie_id
#     return false
#   end
#   audience_score = rt_json['ratings']['audience_score']
#   rt_movie_id = rt_json['id']
#   return critics_score, audience_score, rt_movie_id
# end


# def check_if_six_reviews_exist(rt_movie_id)
#   request_url = "http://api.rottentomatoes.com/api/public/v1.0/movies/"
#   request_url += rt_movie_id.to_s + "/reviews.json?"
#   request_url += "apikey=" + ENV['rt_key']
#   request_url += "&review_type=all"

#   resp = Net::HTTP.get_response(URI(request_url))
#   total_reviews = JSON(resp.body)['total']
#   begin
#     if total_reviews < 6 then
#       return false
#     else
#       return true
#     end
#   rescue NoMethodError
#     return false
#   end

# end


# def add_rt_info(imdb_movie_id, movie_hash)
#   reviews_on_rt = check_if_rt_scores_exist_and_return(imdb_movie_id)
#   if ! reviews_on_rt then
#     return false
#   end
#   critics_score, audience_score, rt_movie_id = reviews_on_rt

#   if ! check_if_six_reviews_exist(rt_movie_id) then
#     puts "Less than six reviews"
#     puts imdb_movie_id

#     return false
#   end

#   return critics_score, audience_score
# end
