require_relative "../test_helper"

class UserCanCreateATaskTest < FeatureTest

  def test_user_can_create_a_robot
    visit "/"
    click_link "Create Robot"

    assert_equal "/robots/new", current_path

    fill_in "robot[name]", with: "Lane"
    fill_in "robot[city]", with: "Denver"
    fill_in "robot[state]", with: "Colorado"
    fill_in "robot[birthdate]", with: "10/10/40"
    fill_in "robot[date_hired]", with: "11/11/42"
    fill_in "robot[department]", with: "Student"

    page.find("#submit").click

    assert_equal "/robots", current_path

    assert page.has_content?("Robot Directory")
    assert page.find('h3 a').has_content?("Lane")
  end
end
