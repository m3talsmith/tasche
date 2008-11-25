require 'test_helper'

class TagTest < ActiveSupport::TestCase
  fixtures :tags
  def test_have_a_users
    tag = Tag.find :first
    assert tag.users.length > 0, "we couldn't find any users for the tag" 
  end
  def test_have_tasks
    tag = Tag.find :first
    assert tag.tasks.length > 0, "we couldn't find any tasks for tag"
  end
  def test_have_projects
    tag = Tag.find :first
    assert tag.projects.length > 0, "we couldn't find any projects for tag"
  end
  def test_should_list_all_tags
    tag = Tag.find :all
    assert tag.length > 0, "we coulnd't find any tags"
  end
end
