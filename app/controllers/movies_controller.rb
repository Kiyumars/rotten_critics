class MoviesController < ApplicationController

  def new
    game_session = params[:game_id]
    game_model = Game.find(game_session)
    game_movies = game_model.movies
    if game_model.movies.count < 1
      flash[:danger] = "No more movies left! Choose another actor or actress!"
      redirect_to new_game_path
      return
    end
    new_movie_id = game_model.movies.sample
    game_movies.delete(new_movie_id)
    game_model.update_attribute(:movies, game_movies)
    redirect_to edit_game_movie_path(game_session, new_movie_id)
  end

	def create
	end

  def edit
    @game_session = Game.find(params[:game_id])
    @movie = Movie.find_by(:tmdb_id => params[:id])
    @players = @game_session.players
  end

  def update
    @game_session = Game.find(params[:game_id])
    @movie = Movie.find_by(:tmdb_id => params[:id])
    @correct_score = @movie.critics_score

    @players = @game_session.players
    guesses = players_guesses
    @players.each do |game_player|
      guess = guesses[game_player.id.to_s]["guess"]
      if guess.empty? || !is_number?(guess.to_s) || guess.to_i < 0 || guess.to_i > 100
        flash.now[:danger] = "Please enter a number between 0 and 100."
        render 'edit'
        return
      end
      penalty_points = (@correct_score - guess.to_i).abs
      game_player.update_attribute(:score, game_player.score + penalty_points)
    end
  end

	private

  def players_guesses
      params.require(:player)
  end

  def is_number?(string)
    string =~ /\A\d+\z/ ? true : false
  end
end
