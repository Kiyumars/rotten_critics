class SessionsController < ApplicationController

  def new
  end

  def create
  	create_game_session_id
		create_players_hash(params[:session][:players])
		redirect_to show_movie_path
  end

  def show
  end

  def update
  end

  def destroy
  	reset_session
  	redirect_to new_session_path
  end

end
