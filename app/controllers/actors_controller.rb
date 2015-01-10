
require 'json'
require 'uri'

require 'net/http'



class ActorsController < ApplicationController
  def new
  end

  def create


    actor_in_db = Actor.find_by(:name => params[:actor_name].downcase)
    if actor_in_db.nil?
      create_new_actor_model(params[:actor_name].downcase)

    elsif actor_in_db
      @actor = actor_in_db
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

end


def create_new_actor_model(actor_name)
      actor_name = params[:actor_name].downcase.scan(/\w+[a-zA-Z]/)
      actor_url =  prepare_actor_url_parameter_for_tmdb(actor_name)
      actor_object = search_tmdb_for_actor_and_return_filmography(actor_url)
      @actor_json, @biography, @filmography = actor_object
      @film_list = Array.new
      @filmography["cast"].each do |movie_id|
        @film_list.push(movie_id['id'].to_s)
      end
      @actor = Actor.new( name: @actor_json["name"].downcase, tmdb_id: @actor_json["id"],
                          imdb_id: @actor_json["imdb_id"], bio: @actor_json["biography"],
                          birthday: @actor_json["birthday"], movies: @film_list)
      @actor.save
end

def search_tmdb_for_actor_and_return_filmography(actor_parameter)
  search_actor = request_tmdb_json("search/person", actor_parameter)
  actor_id = search_actor['results'][0]['id'].to_s
  actor_biography_request_url = "person/" + actor_id
  actor_json = request_tmdb_json(actor_biography_request_url)
  biography = actor_json['biography']
  actor_filmography_request_url = "person/" + actor_id + "/movie_credits"
  actor_filmography = request_tmdb_json(actor_filmography_request_url)
  return actor_json, biography, actor_filmography
end


def request_tmdb_json(request_type_url, extra_url='')
  request_url = "http://api.themoviedb.org/3/"
  request_url += request_type_url
  request_url += "?api_key="
  request_url += ENV['tmdb_key']
  request_url += extra_url

  resp = Net::HTTP.get_response(URI(request_url))
  return JSON(resp.body)
end


def prepare_actor_url_parameter_for_tmdb(actor_name_list)
  url_parameter = "&query=" + actor_name_list.join("+")
end

