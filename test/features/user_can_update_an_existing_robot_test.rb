require_relative "../test_helper"

class UserCanUpdateAnExistingRobotTest < FeatureTest

  def test_user_can_update_an_existing_robot
    robot1 = robot_directory.create({name: 'George',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    birthdate: '10/10/10',
                                    date_hired: '11/11/11',
                                    department: 'Loader'})
    visit "/"
    click_link "Robot Directory"

    assert_equal "/robots", current_path
    click_link("Edit")

    fill_in "robot[name]", with: "Lane"
    fill_in "robot[city]", with: "Denver"
    fill_in "robot[state]", with: "Colorado"
    fill_in "robot[birthdate]", with: "10/10/40"
    fill_in "robot[date_hired]", with: "11/11/42"
    fill_in "robot[department]", with: "Student"

    page.find("#submit").click
    assert page.has_content?("Lane")
    assert page.has_content?("Robot Directory")
  end
end
