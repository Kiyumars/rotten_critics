# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150116113753) do

  create_table "actors", force: true do |t|
    t.string   "name"
    t.string   "tmdb_id"
    t.string   "imdb_id"
    t.text     "bio"
    t.text     "movies"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "game_id"
    t.string   "movies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "tmdb_id"
    t.string   "imdb_id"
    t.string   "title"
    t.text     "overview"
    t.date     "release_date"
    t.string   "tagline"
    t.string   "poster_path"
    t.integer  "critics_score"
    t.integer  "audience_score"
    t.string   "cast"
    t.string   "directors"
    t.string   "screenwriters"
    t.string   "trailer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "game_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
