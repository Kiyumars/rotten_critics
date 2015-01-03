class Actor < ActiveRecord::Base
	serialize :movies, Array
end
