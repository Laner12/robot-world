require_relative "../test_helper"

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({"id" => 12,
                       "name" => 'George',
                       "city" => 'Denver',
                       "state" => 'Colorado',
                       "birthdate" => '10/10/10',
                       "date_hired" => '11/11/11',
                       "department" => 'Loader'})

    assert_equal 12, robot.id
    assert_equal "George", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "10/10/10", robot.birthdate
    assert_equal "11/11/11", robot.date_hired
    assert_equal "Loader", robot.department
    assert_instance_of Robot, robot

    refute_equal 10, robot.id
    refute_equal "Sandy", robot.name
    refute_equal "Denver", robot.department
  end
end
