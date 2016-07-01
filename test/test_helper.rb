ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/enviroment', __FILE__)

require "minitest/autorun"
require "minitest/pride"
require "capybara/dsl"
require "launchy"
require "sqlite3"

module TestHelpers

  def teardown
    robot_directory.delete_all
    super
  end

  def robot_directory
    database = SQLite3::Database.new('db/robot_directory_test.db')
    database.results_as_hash = true
    @database ||= RobotDirectory.new(database)
  end
end


Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
