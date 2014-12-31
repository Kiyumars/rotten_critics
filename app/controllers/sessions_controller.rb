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
  	correct_score = 92

  	session[:players_names].each do |player|
  		session[:players_scores][player] += (correct_score - params[:session][player].to_i).abs
  	end

  end

  def destroy
  	reset_session
  	redirect_to new_session_path
  end

end
