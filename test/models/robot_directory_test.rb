require_relative "../test_helper"

class RobotDirectoryTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_directory.all.first.id
  end

  def test_it_creates_a_task
    robot_directory.create(name: 'George',
                           city: 'Denver',
                           state: 'Colorado',
                           birthdate: '10/10/10',
                           date_hired: '11/11/11',
                           department: 'Loader')

    assert_equal current_robot_id, robot_directory.all.first.id

    robot = robot_directory.find(robot_directory.all.first.id)

    assert_equal "George", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "10/10/10", robot.birthdate
    assert_equal "11/11/11", robot.date_hired
    assert_equal "Loader", robot.department
    assert_instance_of Robot, robot
  end

  def test_the_all_method
    assert_equal 0, robot_directory.all.count

    robot_directory.create(name: 'George',
                           city: 'Denver',
                           state: 'Colorado',
                           birthdate: '10/10/10',
                           date_hired: '11/11/11',
                           department: 'Loader')

    robot_directory.create(name: 'Sandy',
                           city: 'Littleton',
                           state: 'Colorado',
                           birthdate: '09/09/09',
                           date_hired: '10/10/10',
                           department: 'Manager')

    assert_equal 2, robot_directory.all.count
    assert_equal current_robot_id, robot_directory.all.first.id
    assert_instance_of Robot, robot_directory.all[1]
  end

  def test_it_finds_robots
    robot_directory.create(name: 'George',
                           city: 'Denver',
                           state: 'Colorado',
                           birthdate: '10/10/10',
                           date_hired: '11/11/11',
                           department: 'Loader')

    robot_directory.create(name: 'Sandy',
                           city: 'Littleton',
                           state: 'Colorado',
                           birthdate: '09/09/09',
                           date_hired: '10/10/10',
                           department: 'Manager')

    robot = robot_directory.find(current_robot_id)
    assert_equal "George", robot.name

    robot = robot_directory.find(current_robot_id + 1)
    assert_equal "Sandy", robot.name
  end

  def test_it_updates
    robot_directory.create(name: 'George',
                           city: 'Denver',
                           state: 'Colorado',
                           birthdate: '10/10/10',
                           date_hired: '11/11/11',
                           department: 'Loader')

    updated_robot = {name: 'George',
                     city: 'Denver',
                     state: 'Colorado',
                     birthdate: '10/10/10',
                     date_hired: '11/11/11',
                     department: 'CEO'}

    robot = robot_directory.find(current_robot_id)
    assert_equal "Loader", robot.department

    robot_directory.update(robot.id, updated_robot)

    robot = robot_directory.find(current_robot_id)
    assert_equal "CEO", robot.department
  end

  def test_it_destroys
    assert_equal 0, robot_directory.all.count

    robot_directory.create(name: 'George',
                           city: 'Denver',
                           state: 'Colorado',
                           birthdate: '10/10/10',
                           date_hired: '11/11/11',
                           department: 'Loader')

    robot_directory.create(name: 'Sandy',
                           city: 'Littleton',
                           state: 'Colorado',
                           birthdate: '09/09/09',
                           date_hired: '10/10/10',
                           department: 'Manager')

    assert_equal 2, robot_directory.all.count
    robot = robot_directory.find(current_robot_id)

    robot_directory.destroy(robot.id)

    assert_equal 1, robot_directory.all.count
  end

  def test_the_delete_all_method
    assert_equal 0, robot_directory.all.count

    robot_directory.create(name: 'George',
                           city: 'Denver',
                           state: 'Colorado',
                           birthdate: '10/10/10',
                           date_hired: '11/11/11',
                           department: 'Loader')

    robot_directory.create(name: 'Sandy',
                           city: 'Littleton',
                           state: 'Colorado',
                           birthdate: '09/09/09',
                           date_hired: '10/10/10',
                           department: 'Manager')

    assert_equal 2, robot_directory.all.count

    robot_directory.delete_all

    assert_equal 0, robot_directory.all.count
  end
end
