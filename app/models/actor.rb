class Actor < ActiveRecord::Base
	serialize :movies, Array
  validates :movies, presence: true
end
