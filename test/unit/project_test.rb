require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :projects
  def test_should_list_all_projects
    projects = Project.find :all
    assert projects.length > 0,"we couldn't find any projects"
    assert projects.each {|project| project.is_a? Project}, "we couldn't find a valid project"
  end
  def test_project_has_a_user
    project = Project.find :first
    assert project.users.length > 0, "we couldn't find any users for a project"
    assert project.users.each {|user| user.is_a? User}, "couldn't find a valid user"
  end
end
