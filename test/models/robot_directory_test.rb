require_relative "../test_helper"

class RobotDirectoryTest < Minitest::Test
  include TestHelpers
  #
  # def current_task_id
  #   task_manager.all.first.id
  # end
  #
  # def test_it_creates_a_task
  #   # assert_equal 0, task_manager.all.first.id
  #   # need to alter all my shit now
  #
  #   task_manager.create(title: "Learn to code", description: "Study your face off")
  #
  #   assert_equal current_task_id, task_manager.all.first.id
  #
  #   task = task_manager.find(task_manager.all.first.id)
  #
  #   assert_equal "Learn to code", task.title
  #   assert_equal "Study your face off", task.description
  #   assert_instance_of Task, task
  # end
  #
  # def test_the_all_method
  #   # assert_equal 0, task_manager.all.first.id
  #   task_manager.create(title: "Learn to code", description: "Study your face off")
  #   task_manager.create(title: "Finish robo world", description: "Finish assignment")
  #   task_manager.create(title: "Do homework", description: "Do this before leaving")
  #
  #   assert_equal current_task_id, task_manager.all.first.id
  #   assert_instance_of Task, task_manager.all[1]
  # end
  #
  # def test_it_finds_tasks
  #   task_manager.create(title: "Learn to code", description: "Study your face off")
  #   task_manager.create(title: "Finish robo world", description: "Finish assignment")
  #   task_manager.create(title: "Do homework", description: "Do this before leaving")
  #   # i doubt three will work and it may need to be first and last
  #   task = task_manager.find(current_task_id)
  #   assert_equal "Learn to code", task.title
  #
  #   task = task_manager.find(current_task_id + 1)
  #   assert_equal "Finish robo world", task.title
  #
  #   task = task_manager.find(current_task_id + 2)
  #   assert_equal "Do homework", task.title
  # end
  #
  # def test_it_updates
  #   task_manager.create(title: "Learn to code", description: "Study your face off")
  #   updated_task = {title: "Finish robo world", description: "Finish assignment"}
  #
  #   task = task_manager.find(task_manager.all.first.id)
  #   assert_equal "Learn to code", task.title
  #
  #   task_manager.update(task_manager.all.first.id, updated_task)
  #
  #   task = task_manager.find(task_manager.all.first.id)
  #   assert_equal "Finish robo world", task.title
  # end
  #
  # def test_it_destroys
  #   # assert_equal 0, task_manager.all.first.id
  #
  #   task_manager.create(title: "Learn to code", description: "Study your face off")
  #   task_manager.create(title: "Finish robo world", description: "Finish assignment")
  #
  #   assert_equal current_task_id, task_manager.all.first.id
  #
  #   task = task_manager.find(task_manager.all.first.id)
  #
  #   task_manager.destroy(task.id)
  #
  #   assert_equal current_task_id, task_manager.all.first.id
  # end
end
