require_relative "../test_helper"

class UserCanDeleteARobotTest < FeatureTest

  def test_user_can_delete_a_robot
    robot1 =robot_directory.create({name: 'George',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    birthdate: '10/10/10',
                                    date_hired: '11/11/11',
                                    department: 'Loader'})
    visit "/"
    click_link "Robot Directory"

    assert_equal "/robots", current_path

    assert page.has_content?("George")

    page.find_button("Delete").click

    assert_equal "/robots", current_path

    assert page.has_content?("Robot Directory")
    refute page.has_content?("George")
  end
end
