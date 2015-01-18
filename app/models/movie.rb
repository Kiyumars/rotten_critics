class Movie < ActiveRecord::Base
	validate :title, presence: true
	validate :overview, presence:true
	validate :critics_score, presence:true
end
