ENV['RAILS_ENV'] ||= 'test'
tmdb_key = ENV['tmdb_key']
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  self.use_instantiated_fixtures = true

  # Add more helper methods to be used by all tests here...
end
