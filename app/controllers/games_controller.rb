class GamesController < ApplicationController
  def new
  end

  def create
    @game_id =  ('a'..'z').to_a.shuffle[0..7].join
    session[:game_id] = @game_id
    @game_session = Game.create!(:game_id => @game_id)
    players_list = params[:players].titleize.scan(/\w+[a-zA-Z]/).uniq
    players_list.each do |player|
      # @player = Player.create!(:game_id => game_id, :name => player, :score => 0)
      @game_session.players.create( :name => player, :score => 0)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
