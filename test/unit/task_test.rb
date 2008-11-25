require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  fixtures :tasks
  def test_task_has_tags
    task = Task.find :first
    assert task.tags.length > 0, "we could not find any tags for any tasks"  
  end
  def test_should_list_all_tasks
    task = Task.find :all
    assert task.length > 0, "we could not find any tasks"
  end
  def test_task_has_projects
    task = Task.find :first
    assert task.projects.length > 0, "we couldn't find any projects for task"
  end
  #def test_has_many_users
    #task = Task.find :first
    #assert task.users.length is > 0, " we couldn't fin any users for tasks"
  #end
end
