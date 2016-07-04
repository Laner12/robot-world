require_relative "../test_helper"

class UserCanSeeAllRobotsTest < FeatureTest

  def test_user_can_see_all_created_robots
    robot1 =robot_directory.create({name: 'George',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    birthdate: '10/10/10',
                                    date_hired: '11/11/11',
                                    department: 'Loader'})

    robot2 = robot_directory.create({name: 'Sandy',
                                     city: 'Littleton',
                                     state: 'Colorado',
                                     birthdate: '09/09/09',
                                     date_hired: '10/10/10',
                                     department: 'Manager'})
    visit "/"
    click_link "Robot Directory"

    assert_equal "/robots", current_path

    assert page.has_content?("Robot Directory")

    within("#robot_list") do
      assert page.has_content?("George")
      assert page.has_link?("George")
      assert page.has_content?("Sandy")
      assert page.has_link?("Sandy")
      assert page.has_link?("Edit")
      assert page.has_button?("Delete")
    end
  end
end
